from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from app.api.dependencies import get_db, get_current_user
from app.models.stopsFinalProducts import StopsFinalProducts
from app.schemas.stopsFinalProducts import StopsFinalProducts as StopsFinalProductsServices
from app.services.stopsFinalProducts_services import Create_stopfinalprods, Get_stops

router = APIRouter()

@router.post("/api/stopfinalprods/", response_model=StopsFinalProductsServices)
def create_stopfinalprods_endpoint(prod: StopsFinalProductsServices, db: Session = Depends(get_db), user = Depends(get_current_user)):
    return Create_stopfinalprods(db=db, data=prod)

@router.get("/api/stopfinalprods/")
def Get_stops_endpoint(db: Session = Depends(get_db)):
    return Get_stops(db=db)