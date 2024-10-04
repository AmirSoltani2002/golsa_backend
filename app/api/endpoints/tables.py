from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from typing import List
from typing import List, Any, Union, Literal
from app.db import inspector
from app.services.tables_services import Get_tables, Get_table_columns, Get_rows, Delete_row, Update_row, Search_rows, Insert_row
from app.api.dependencies import get_db, get_current_user

router = APIRouter()

@router.get("/tables/")
def F(db: Session = Depends(get_db)):
    return Get_tables(db)

@router.get("/table/{table_name}/")
def read_materials(table_name: str, db: Session = Depends(get_db)):
    return [{column['name']: column['type']} for column in inspector.get_columns(table_name)] 

@router.get("/values/{table_name}/{start}/{end}/{order}/{asc}/")
def read_materials(table_name: str, start: int, end: int, order: str, asc: bool = True, db: Session = Depends(get_db)):
    return Get_rows(table_name, db, start, end, order, asc)

@router.delete("/table/{table_name}/{id}/")
def read_materials(table_name: str,id: int, db: Session = Depends(get_db), user = Depends(get_current_user)):
    if user['role'] != "admin":
        raise HTTPException(status_code=403, detail="Not enough permission")
    return Delete_row(table_name, db, id)

@router.put("/table/{table_name}/{id}/")
def read_materials(data: dict, table_name: str, id: int, db: Session = Depends(get_db), user = Depends(get_current_user)):
    if user['role'] == "viewer":
        raise HTTPException(status_code=403, detail="Not enough permission")
    return Update_row(table_name, db, id, data)

@router.get("/table/{table_name}/{column}/{content}/{type}/")
def read_materials(table_name: str, column: str, content: Any, type: Literal['str', 'int',' float', 'bool']
                   , db: Session = Depends(get_db)):
    return Search_rows(table_name, db, column, content, type)

@router.post("/table/{table_name}/")
def read_materials(data: dict, table_name: str ,db: Session = Depends(get_db), user = Depends(get_current_user)):
    if table_name == "user":
        raise HTTPException(status_code=404, detail="Not found")
    if user['role'] == "viewer":
        raise HTTPException(status_code=403, detail="Not enough permission")
    return Insert_row(table_name, db, data)