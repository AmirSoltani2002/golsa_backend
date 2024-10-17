from fastapi import APIRouter, Depends, HTTPException, UploadFile, File
from sqlalchemy.orm import Session
from typing import Any, Literal, Optional
from app.services.tables_services import Get_tables, Get_table_columns_types, Get_rows, Delete_row, Update_row, Search_rows, Insert_row
from app.api.dependencies import get_db, get_current_user, image_dependency
from app.api.dependencies import IMG_PTH
import os
import shutil

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

@router.get("/api/values/{table_name}/{start}/{end}/{order}/{asc}/")
def read_materials(table_name: str, start: int, end: int, order: str, asc: bool = True, db: Session = Depends(get_db), user = Depends(get_current_user)):
    ret = Get_rows(table_name, db, start, end, order, asc)
    if user['role'] != 'admin' and table_name == 'rawmaterials':
            for i in range(len(ret)):
                del ret[i]['price']
    return ret

@router.delete("/api/table/{table_name}/{id}/")
def read_materials(table_name: str,id: int, db: Session = Depends(get_db), user = Depends(get_current_user)):
    if user['role'] != "admin":
        raise HTTPException(status_code=403, detail="Not enough permission")
    return Delete_row(table_name, db, id)

@router.put("/api/table/{table_name}/{id}/")
def read_materials(data: dict, table_name: str, id: int, db: Session = Depends(get_db), user = Depends(get_current_user), image = None):
    if user['role'] == "viewer":
        raise HTTPException(status_code=403, detail="Not enough permission")
    # Handle image upload for specific tables
    if table_name in ['pipeproduct', 'fittingproduct']:        
        # If an image is uploaded, save it and add the file path to `data`
        if image is not None:
            os.makedirs(IMG_PTH, exist_ok=True)
            file_extension = os.path.splitext(image.filename)[1]
            file_path = os.path.join(IMG_PTH, data['name'] + file_extension)
            data['image'] = data['name'] + file_extension
            
            # Save the image to the server
            with open(file_path, "wb") as buffer:
                shutil.copyfileobj(image.file, buffer)
        else:
            # If no image is provided, you can either:
            # (a) Ensure that the image field is removed from `data`
            data.pop('image', None)
    else:
        # If the table doesn't require an image, ensure the `image` field is removed if present
        data.pop('image', None)
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
    user = Depends(get_current_user), 
    image = None
):
    # Check user permissions
    if user['role'] == "viewer":
        raise HTTPException(status_code=403, detail="Not enough permission")
    
    if table_name == 'rawmaterials' and user['role'] != 'admin':
        raise HTTPException(status_code=403, detail="Not enough permission")
    
    if table_name == "users":
        raise HTTPException(status_code=404, detail="Not found")

    # Handle image upload for specific tables
    if table_name in ['pipeproduct', 'fittingproduct']:        
        # If an image is uploaded, save it and add the file path to `data`
        if image is not None:
            os.makedirs(IMG_PTH, exist_ok=True)
            file_extension = os.path.splitext(image.filename)[1]
            file_path = os.path.join(IMG_PTH, data['name'] + file_extension)
            data['image'] = data['name'] + file_extension
            
            # Save the image to the server
            with open(file_path, "wb") as buffer:
                shutil.copyfileobj(image.file, buffer)
        else:
            # If no image is provided, you can either:
            # (a) Ensure that the image field is removed from `data`
            data.pop('image', None)
    else:
        # If the table doesn't require an image, ensure the `image` field is removed if present
        data.pop('image', None)

    # Insert row into the appropriate table
    return Insert_row(table_name, db, data)