from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from typing import List
from app.services.tables_services import Get_tables, Get_table_columns
from app.api.dependencies import get_db

router = APIRouter()

@router.get("/tables/")
def read_materials(db: Session = Depends(get_db)):
    return Get_tables(db)

@router.get("/tables/{table_name}/")
def read_materials(table_name: str, db: Session = Depends(get_db)):
    return Get_table_columns(table_name, db)