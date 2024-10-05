from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from typing import List
from app.services.operators_services import Get_operators
from app.schemas.operators import Operator
from app.api.dependencies import get_db

router = APIRouter()

@router.get("/api/operator/{fitting}", response_model=List[Operator])
def read_materials(fitting: bool, db: Session = Depends(get_db)):
    operators = Get_operators(db, fitting)
    if not operators:
        raise HTTPException(status_code=404, detail="Operator not found")
    return operators
