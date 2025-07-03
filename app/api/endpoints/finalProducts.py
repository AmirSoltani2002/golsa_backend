from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from app.api.dependencies import get_db, get_current_user
from app.models.finalProduct import FinalProduct
from app.schemas.finalProducts import FinalProduct as FinalProductSchema
from app.services.finalProducts_services import Create_finalprod, update_finalprod

router = APIRouter()

@router.post("/api/finalprod/", response_model=FinalProductSchema)
def create_finalprod_endpoint(prod: FinalProductSchema, db: Session = Depends(get_db), user = Depends(get_current_user)):
    return Create_finalprod(db=db, data=prod)

@router.put("/api/finalprod/{id}", response_model=FinalProductSchema)
def update_finalprod_endpoint(id: int, prod: FinalProductSchema, db: Session = Depends(get_db), user = Depends(get_current_user)):
    return update_finalprod(db = db, id = id, data = prod)