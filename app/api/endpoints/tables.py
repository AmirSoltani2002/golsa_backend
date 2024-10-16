from fastapi import APIRouter, Depends, HTTPException, UploadFile, File
from sqlalchemy.orm import Session
from typing import List, Any, Union, Literal, Optional
from app.db import inspector
from app.services.tables_services import Get_tables, Get_table_columns_types, Get_rows, Delete_row, Update_row, Search_rows, Insert_row
from app.api.dependencies import get_db, get_current_user
from app.api.dependencies import IMG_PTH
import os
import shutil

router = APIRouter()

@router.get("/api/tables/")
def F(db: Session = Depends(get_db)):
    ret = Get_tables(db)
    # if user['role'] != 'admin':
    #     ret.remove('recipes')
    return ret


@router.get("/api/table/{table_name}/")
def read_materials(table_name: str, db: Session = Depends(get_db)):
    return Get_table_columns_types(table_name, db) 

@router.get("/api/values/{table_name}/{start}/{end}/{order}/{asc}/")
def read_materials(table_name: str, start: int, end: int, order: str, asc: bool = True, db: Session = Depends(get_db), user = Depends(get_current_user)):
    ret = Get_rows(table_name, db, start, end, order, asc)
    # if user['role'] != 'admin' and table_name == 'rawmaterials':
    #         for i in range(len(ret)):
    #             del ret[i]['price']
    return ret

@router.delete("/api/table/{table_name}/{id}/")
def read_materials(table_name: str,id: int, db: Session = Depends(get_db), user = Depends(get_current_user)):
    if user['role'] != "admin":
        raise HTTPException(status_code=403, detail="Not enough permission")
    return Delete_row(table_name, db, id)

@router.put("/api/table/{table_name}/{id}/")
def read_materials(data: dict, table_name: str, id: int, db: Session = Depends(get_db), user = Depends(get_current_user), image: Optional[UploadFile] = File(None)):
    if user['role'] == "viewer":
        raise HTTPException(status_code=403, detail="Not enough permission")
    if table_name in ['pipeproduct', 'fittingproduct']:
        os.makedirs(IMG_PTH, exist_ok=True)
        if image != None:
            file_extension = os.path.splitext(image.filename)[1]
            file_path = os.path.join(IMG_PTH, data['name'] + file_extension)
            data['image'] = data['name'] + file_extension
            with open(file_path, "wb") as buffer:
                shutil.copyfileobj(image.file, buffer)
    return Update_row(table_name, db, id, data)

@router.get("/api/table/{table_name}/{column}/{content}/{type}/")
def read_materials(table_name: str, column: str, content: Any, type: Literal['str', 'int',' float', 'bool']
                   , db: Session = Depends(get_db)):
    return Search_rows(table_name, db, column, content, type)

@router.post("/api/table/{table_name}/")
def read_materials(data: dict, table_name: str ,db: Session = Depends(get_db), user = Depends(get_current_user), image: Optional[UploadFile]  = File(None)):
    if user['role'] == "viewer":
        raise HTTPException(status_code=403, detail="Not enough permission")
    if table_name =='rawmaterials' and user['role'] != 'admin':
        raise HTTPException(status_code=403, detail="Not enough permission")
    if table_name == "user":
        raise HTTPException(status_code=404, detail="Not found")
    elif table_name in ['pipeproduct', 'fittingproduct']:
        os.makedirs(IMG_PTH, exist_ok=True)
        if image != None:
            file_extension = os.path.splitext(image.filename)[1]
            file_path = os.path.join(IMG_PTH, data['name'] + file_extension)
            data['image'] = data['name'] + file_extension
            with open(file_path, "wb") as buffer:
                shutil.copyfileobj(image.file, buffer)
    return Insert_row(table_name, db, data)