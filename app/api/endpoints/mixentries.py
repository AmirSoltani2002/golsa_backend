from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from app.schemas import mixentries as mixer_schemas
from app.services.mixentries_services import Create_mixentry
from app.api.dependencies import get_db

router = APIRouter()

@router.post("/mixentry/", response_model=mixer_schemas.MixEntryResponse)
def create_mixer_endpoint(mix: mixer_schemas.MixEntry, db: Session = Depends(get_db)):
    return Create_mixentry(db=db, mix=mix)