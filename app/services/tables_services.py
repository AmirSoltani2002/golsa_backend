from typing import List, Any, Union, Literal
from sqlalchemy.orm import Session
from sqlalchemy import text, update, delete, select, insert, Table, MetaData
from fastapi import HTTPException

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


def Get_rows(name:str, db: Session, start: int, end: int, order: str, asc: bool):
    DESC = 'DESC' if not asc else 'ASC'
    columns = Get_table_columns(name, db)
    result = db.execute(
            text(f"""SELECT *
                FROM {name}
                ORDER BY {order} {DESC}
                LIMIT ({end} - {start} + 1) OFFSET {start};
                """)
            ).fetchall()
    return [dict(zip(columns, list(row))) for row in result] 

def Delete_row(name: str, db:Session, id: int):
    metadata = MetaData()
    table = Table(name, metadata, autoload_with=db.bind)
    stm = delete(table).where(table.c.id == id)
    result = db.execute(stm)
    db.commit()
    if result.rowcount == 0:
        raise HTTPException(status_code=404, detail="Row not found")
    return id

    
def Update_row(name: str, db:Session, id: int, data: dict):
    metadata = MetaData()
    table = Table(name, metadata, autoload_with=db.bind)
    stm = update(table).where(table.c.id == id).values(**data)
    result = db.execute(stm)
    db.commit()
    if result.rowcount == 0:
        raise HTTPException(status_code=404, detail="Row not found")
    return id

def Search_rows(name: str, db:Session, column: str,  content: Any, type: Literal['str', 'int',' float', 'bool']):
    columns = Get_table_columns(name, db)
    metadata = MetaData()
    table = Table(name, metadata, autoload_with=db.bind)
    if column not in column:
        raise HTTPException(status_code=404, detail="Column not found")
    if type == 'str':
        content = str(content)
    elif type == 'int':
        content = int(content)
    elif type == 'float':
        content = int(content)
    elif type == 'bool':
        content = float(content)
    if isinstance(content, str):
        stm = select(table).where(getattr(table.c, column).like(f"%{content}%"))
    else:
        stm = select(table).where(getattr(table.c, column) == content)
    result = db.execute(stm).fetchall()
    return [dict(zip(columns, list(row))) for row in result] 

def Insert_row(name: str, db: Session, data: dict):
    metadata = MetaData()
    table = Table(name, metadata, autoload_with=db.bind)
    stm = insert(table).values(**data)
    result = db.execute(stm)
    db.commit()
    return result.inserted_primary_key[0]


