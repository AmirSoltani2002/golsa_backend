from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from typing import List
from app.services.pipeproducts_services import Get_pipes
from app.services.fittingproducts_services import Get_fittings
from app.schemas.products import Product
from app.api.dependencies import get_db

router = APIRouter()

@router.get("/api/product/{category}", response_model=List[Product])
def read_materials(category: str, db: Session = Depends(get_db)):
    products = Get_fittings(db) if category == 'اتصالات' else Get_pipes(db)
    if not products:
        raise HTTPException(status_code=404, detail="Products not found")
    return products
