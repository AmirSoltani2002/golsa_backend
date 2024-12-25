from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from typing import List
from app.services.recipes_services import Get_recipes
from app.schemas.recipes import Recipe
from app.api.dependencies import get_db, get_current_user

router = APIRouter()

@router.get("/api/recipes/")
def read_materials(db: Session = Depends(get_db)):
    # if user['role'] != 'admin':
    #     raise HTTPException(status_code = 403, detail = 'Not enough permission')
    return Get_recipes(db)
