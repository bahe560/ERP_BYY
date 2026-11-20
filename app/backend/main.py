import os
from pathlib import Path

from dotenv import load_dotenv
load_dotenv(Path(__file__).resolve().parents[1] / ".env")

from fastapi import FastAPI, HTTPException, Depends
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel, Field

from backend.db import get_connection, db_transaction
from backend.auth import create_token, current_user

app = FastAPI(title=os.getenv("APP_NAME", "ERP BYY"), version="0.1.0")
app.add_middleware(CORSMiddleware, allow_origins=["http://localhost:5173", "http://127.0.0.1:5173"], allow_credentials=True, allow_methods=["*"], allow_headers=["*"])

class LoginRequest(BaseModel):
    username: str = Field(min_length=3, max_length=60)
    password: str = Field(min_length=1, max_length=256)

@app.get("/api/health")
def health():
    try:
        with get_connection() as conn:
            conn.execute("SELECT 1")
        return {"status": "ok", "database": "connected"}
    except Exception:
        raise HTTPException(status_code=503, detail="Database unavailable")

@app.post("/api/auth/login")
def login(data: LoginRequest):
    try:
        with get_connection() as conn:
            with conn.transaction():
                row = conn.execute("SELECT erp.authenticate(%s, %s, %s) AS user_id", (data.username, data.password, None)).fetchone()
                user_id = row["user_id"]
    except Exception as exc:
        # Do not leak database internals to clients.
        raise HTTPException(status_code=503, detail="Authentication service unavailable") from exc
    if not user_id:
        raise HTTPException(status_code=401, detail="اسم المستخدم أو كلمة المرور غير صحيحة، أو الحساب غير متاح")
    return {"access_token": create_token(user_id), "token_type": "bearer", "user_id": user_id}

@app.get("/api/auth/me")
def me(user_id: int = Depends(current_user)):
    try:
        with db_transaction(user_id) as conn:
            user = conn.execute("SELECT id, username, full_name, email, is_active, is_superadmin, default_company_id, must_change_password FROM erp.app_users WHERE id=%s AND is_active", (user_id,)).fetchone()
    except Exception as exc:
        raise HTTPException(status_code=503, detail="User service unavailable") from exc
    if not user:
        raise HTTPException(status_code=401, detail="User no longer active")
    return user

@app.get("/api/dashboard/summary")
def dashboard(user_id: int = Depends(current_user)):
    # First iteration intentionally reports connection and user context only.
    # Accounting KPIs will be connected after company and fiscal-period selection are implemented.
    with db_transaction(user_id) as conn:
        conn.execute("SELECT erp.current_user_id()")
    return {"message": "ERP application foundation is running", "user_id": user_id, "modules": ["accounting", "vouchers", "banking", "reports"]}

@app.get("/api/accounts")
def accounts(user_id: int = Depends(current_user), company_id: int | None = None):
    if company_id is None:
        raise HTTPException(status_code=400, detail="company_id is required")
    # Company schema is being verified before exposing account data.
    with db_transaction(user_id) as conn:
        exists = conn.execute("SELECT 1 FROM erp.companies WHERE id=%s", (company_id,)).fetchone()
        if not exists:
            raise HTTPException(status_code=404, detail="Company not found")
        rows = conn.execute("SELECT id, code, name, category, nature, is_active FROM erp.accounts WHERE company_id=%s ORDER BY code LIMIT 500", (company_id,)).fetchall()
    return rows
