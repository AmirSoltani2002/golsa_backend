from fastapi import APIRouter, Depends, HTTPException, UploadFile, File
from sqlalchemy.orm import Session
from typing import Any, Literal, Optional
from app.services.tables_services import Get_tables, Get_table_columns_types, Get_rows, Delete_row, Update_row, Search_rows, Insert_row, Get_by_id
from app.api.dependencies import get_db, get_current_user, image_dependency
from app.api.dependencies import IMG_PTH
import os
import base64

router = APIRouter()

@router.get("/api/tables/")
def F(db: Session = Depends(get_db), user = Depends(get_current_user)):
    ret = Get_tables(db)
    if user['role'] != 'admin':
        ret.remove('recipes')
    return ret


@router.get("/api/table/{table_name}/")
def read_materials(table_name: str, db: Session = Depends(get_db), user = Depends(get_current_user)):
    ret = Get_table_columns_types(table_name, db) 
    if user['role'] != 'admin' and table_name == 'rawmaterials':
            for i in range(len(ret)):
                if list(ret[i].keys()) == ['price']:
                    del ret[i]
                    break
    return ret

@router.get("/api/table/{table_name}/{id}/")
def read_materials(table_name: str, id: int, db: Session = Depends(get_db)):
    ret = Get_by_id(table_name, id, db)
    if not ret:
        return HTTPException(status_code = 404, detail = "not found")
    return ret

@router.get("/api/values/{table_name}/{start}/{end}/{order}/{asc}/")
def read_materials(table_name: str, start: int, end: int, order: str, asc: bool = True, db: Session = Depends(get_db)):
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
def read_materials(
    data: dict, 
    table_name: str, 
    id: int, 
    db: Session = Depends(get_db), 
    user = Depends(get_current_user)
):
    if user['role'] == "viewer":
        raise HTTPException(status_code=403, detail="Not enough permission")
    # Handle image upload for specific tables
    # Handle image upload for specific tables
    if (table_name in ['pipeproduct', 'fittingproduct'] ) and (data['image']) and (not isinstance(data['image'], str)):     
        # If an image is uploaded, save it and add the file path to `data`
        os.makedirs(IMG_PTH, exist_ok=True)
        image = data['image']
        file_extension = os.path.splitext(image['name'])[1]
        file_path = os.path.join(IMG_PTH, data['code'] + file_extension)   
        bt = image['byte']
        bt = bt.replace("data:image/jpeg;base64,", "")
        # Decode the base64 string into bytes
        image_data = base64.b64decode(bt)    
        # Save the image to the server
        with open(file_path, "wb") as buffer:
            buffer.write(image_data)
        if data['code'] == '':
            raise HTTPException(status_code=422, detail="Null value for required data")
        data['image'] = data['code'] + file_extension
    return Update_row(table_name, db, id, data)

@router.get("/api/table/{table_name}/{column}/{content}/{type}/")
def read_materials(table_name: str, column: str, content: Any, type: Literal['str', 'int',' float', 'bool']
                   , db: Session = Depends(get_db)):
    return Search_rows(table_name, db, column, content, type)

@router.post("/api/table/{table_name}/")
def read_materials(
    data: dict, 
    table_name: str, 
    db: Session = Depends(get_db), 
    user = Depends(get_current_user)
):
    # Check user permissions
    if user['role'] == "viewer":
        raise HTTPException(status_code=403, detail="Not enough permission")
    
    if table_name == 'rawmaterials' and user['role'] != 'admin':
        raise HTTPException(status_code=403, detail="Not enough permission")
    
    if table_name == "users":
        raise HTTPException(status_code=404, detail="Not found")

    # Handle image upload for specific tables
    if table_name in ['pipeproduct', 'fittingproduct'] and data['image']:     
        # If an image is uploaded, save it and add the file path to `data`
        os.makedirs(IMG_PTH, exist_ok=True)
        image = data['image']
        file_extension = os.path.splitext(image['name'])[1]
        file_path = os.path.join(IMG_PTH, data['code'] + file_extension)   
        bt = image['byte']
        bt = bt.replace("data:image/jpeg;base64,", "")
        # Decode the base64 string into bytes
        image_data = base64.b64decode(bt)    
        # Save the image to the server
        with open(file_path, "wb") as buffer:
            buffer.write(image_data)
        if data['code'] == '':
            raise HTTPException(status_code=422, detail="Null value for required data")
        data['image'] = data['code'] + file_extension
    # Insert row into the appropriate table
    return Insert_row(table_name, db, data)