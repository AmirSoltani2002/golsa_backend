# app/api/endpoints/materials.py

from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from typing import List
from app.services.materials_services import Get_materials, Get_material_by_id
from app.schemas.materials import Material, MaterialWithRawMaterial
from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from app.api.dependencies import get_db

router = APIRouter()

@router.get("/materials/", response_model=List[Material])
def read_materials(skip: int = 0, limit: int = 10, db: Session = Depends(get_db)):
    materials = Get_materials(db)
    if not materials:
        raise HTTPException(status_code=404, detail="Materials not found")
    return materials

@router.get("/material/{id}/", response_model=List[MaterialWithRawMaterial])
def get_material_by_id(id: int, db: Session = Depends(get_db)):
    material = Get_material_by_id(id, db)
    if not material:
        raise HTTPException(status_code=404, detail="Material not found")
    return material
