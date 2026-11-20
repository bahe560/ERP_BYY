import os
from contextlib import contextmanager

import psycopg
from psycopg.rows import dict_row

DATABASE_URL = os.getenv("DATABASE_URL")


def get_connection():
    if not DATABASE_URL:
        raise RuntimeError("DATABASE_URL is not configured")
    return psycopg.connect(DATABASE_URL, row_factory=dict_row)


@contextmanager
def db_transaction(user_id: int | None = None):
    conn = get_connection()
    try:
        with conn.transaction():
            if user_id is not None:
                conn.execute("SELECT erp.set_current_user(%s, true)", (user_id,))
            yield conn
    finally:
        conn.close()
