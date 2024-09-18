# app/api/endpoints/materials.py

from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from typing import List
from app.services.machines_services import Get_machines
from app.schemas.machines import Machine
from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from app.api.dependencies import get_db

router = APIRouter()

@router.get("/machine/", response_model=List[Machine])
def read_materials(skip: int = 0, limit: int = 10, db: Session = Depends(get_db)):
    machines = Get_machines(db)
    if not machines:
        raise HTTPException(status_code=404, detail="Machines not found")
    return machines
