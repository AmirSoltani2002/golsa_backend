from typing import List, Any, Union, Literal
from sqlalchemy.orm import Session
from sqlalchemy import text, update, delete, select, insert, Table, MetaData
from fastapi import HTTPException
from sqlalchemy.exc import SQLAlchemyError

def Get_tables(db: Session):
    table_names = db.execute(
            text("SELECT table_name FROM information_schema.tables WHERE table_schema='public'")
            ).fetchall()
    return [name[0] for name in table_names if name[0] != 'users']

def Get_table_columns(name:str, db: Session):
    result = db.execute(
            text(f"""SELECT column_name
                FROM information_schema.columns
                WHERE table_name = '{name}' AND table_schema = 'public';
                """)
            ).fetchall()
    return [row[0] for row in result]

def Get_table_columns_types(name:str, db: Session):
    query = text(f"""
        SELECT column_name, data_type
        FROM information_schema.columns
        WHERE table_name = :table_name AND table_schema = 'public';
    """)

    # Execute the query and fetch results
    result = db.execute(query, {"table_name": name}).fetchall()

    # Raise an error if the table is not found or has no columns
    if not result:
        raise HTTPException(status_code=404, detail=f"Table '{name}' not found or has no columns.")

    # Construct the desired return structure
    columns_info = [{row[0]: {"type": row[1]}} for row in result]

    return columns_info

def Get_rows(name:str, db: Session, start: int, end: int, order: str, asc: bool):
    try:
        DESC = 'DESC' if not asc else 'ASC'
        columns: list = Get_table_columns(name, db)
        result = db.execute(
                text(f"""SELECT *
                    FROM {name}
                    ORDER BY {order} {DESC}
                    LIMIT ({end} - {start} + 1) OFFSET {start};
                    """)
                ).fetchall()
        if name != 'materials':
            return [dict(zip(columns, list(row))) for row in result] 
        else:
            idx = columns.index('material')
            return [dict(zip(columns, list(row))) for row in result if row[idx]]
    except SQLAlchemyError as e:
        raise HTTPException(status_code = 422, detail = str(e))

def Delete_row(name: str, db:Session, id: int):
    try:
        metadata = MetaData()
        table = Table(name, metadata, autoload_with=db.bind)
        stm = delete(table).where(table.c.id == id)
        result = db.execute(stm)
        db.commit()
        if result.rowcount == 0:
            raise HTTPException(status_code=404, detail="Row not found")
        return id
    except SQLAlchemyError as e:
        db.rollback()
        raise HTTPException(status_code = 422, detail = str(e))

    
def Update_row(name: str, db:Session, id: int, data: dict):
    try:
        metadata = MetaData()
        table = Table(name, metadata, autoload_with=db.bind)
        stm = update(table).where(table.c.id == id).values(**data)
        result = db.execute(stm)
        db.commit()
        if result.rowcount == 0:
            raise HTTPException(status_code=404, detail="Row not found")
        return id
    except SQLAlchemyError as e:
        db.rollback()
        raise HTTPException(status_code = 422, detail = str(e))

def Search_rows(name: str, db:Session, column: str,  content: Any, type: Literal['str', 'int',' float', 'bool']):
    try:
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
    except SQLAlchemyError as e:
        db.rollback()
        raise HTTPException(status_code = 422, detail = str(e))

def Insert_row(name: str, db: Session, data: dict):
    metadata = MetaData()
    if name in ['pipeproduct', 'fittingproduct']:
        if not data['image']:
            data['image'] = ''
        table = Table('allproducts', metadata, autoload_with=db.bind)
        tmp_data = {'name': data['name'], 'code': data['code']}
        stm = insert(table).values(**tmp_data)
        db.execute(stm)
    table = Table(name, metadata, autoload_with=db.bind)
    stm = insert(table).values(**data)
    result = db.execute(stm)
    db.commit()
    return result.inserted_primary_key[0]
    # except SQLAlchemyError as e:
    #     db.rollback()
    #     raise HTTPException(status_code = 422, detail = str(e))


