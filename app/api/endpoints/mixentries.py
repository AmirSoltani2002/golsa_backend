from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from app.schemas import mixentries as mixer_schemas
from app.services.mixentries_services import Create_mixentry
from app.services.materials_services import Post_material
from app.services.recipes_services import Create_recipes
from app.api.dependencies import get_db, get_current_user

router = APIRouter()

@router.post("/mixentry/", response_model=mixer_schemas.MixEntryResponse)
def create_mixer_endpoint(mix: mixer_schemas.MixEntry, db: Session = Depends(get_db)):
    # if user['role'] == 'viewer':
    #     raise HTTPException(status_code=403, detail="Not enough permission")
    return Create_mixentry(db=db, mix=mix)

@router.post("/mixentry/other/", response_model=mixer_schemas.MixEntryResponse)
def create_mixer_endpoint(mix: dict, db: Session = Depends(get_db)):
    # if user['role'] == 'viewer':
    #     raise HTTPException(status_code=403, detail="Not enough permission")
    material = Post_material(db)
    rawmaterials = mix['recipe']
    recipes_list = []
    for rawmaterial_id, weight in rawmaterials.items():
        recipes_list.append({'rawmaterial_id': int(rawmaterial_id), 'weight': float(weight), 'material_id':int(material.id)})
    recipes = Create_recipes(db, recipes_list)
    mix['recipe_code'] = material.id
    mix = mixer_schemas.MixEntry(**mix)
    return Create_mixentry(db=db, mix=mix)