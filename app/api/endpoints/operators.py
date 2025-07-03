from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from typing import List
from app.services.operators_services import Get_operators
from app.schemas.operators import Operator
from app.api.dependencies import get_db

router = APIRouter()

@router.get("/api/operator/{type}", response_model=List[Operator])
def read_materials(type: str, db: Session = Depends(get_db), flag: bool = False):
    operators = Get_operators(db, type, flag)
    if not operators:
        raise HTTPException(status_code=404, detail="Operator not found")
    return operators
