from typing import List
from sqlalchemy.orm import Session
from sqlalchemy import text


def Get_tables(db: Session):
    table_names = db.execute(
            text("SELECT table_name FROM information_schema.tables WHERE table_schema='public'")
            ).fetchall()
    return [name[0] for name in table_names]

def Get_table_columns(name:str, db: Session):
    result = db.execute(
            text(f"""SELECT column_name
                FROM information_schema.columns
                WHERE table_name = '{name}' AND table_schema = 'public';
                """)
            ).fetchall()
    return [row[0] for row in result]

