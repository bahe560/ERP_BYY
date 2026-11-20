# ERP BYY Application Foundation

This branch adds an initial web application shell around the existing PostgreSQL ERP schema. It is a development foundation, not production-ready.

## Requirements
- Python 3.11+
- PostgreSQL with the ERP schema installed in a dedicated development database
- `DATABASE_URL` and `JWT_SECRET` configured in `.env`

## Start
1. Copy `.env.example` to `.env` and set values.
2. `python -m venv .venv`
3. Activate the environment, then `pip install -r requirements.txt`
4. `uvicorn backend.main:app --reload`
5. Open `http://127.0.0.1:8000`

API docs: `http://127.0.0.1:8000/docs`

Login is wired to `erp.authenticate`. The API sets the database user context only within request transactions. Do not use the official BYY1 database during initial testing.
