from pydantic import BaseModel
from datetime import date as dt
from datetime import time as tm
from app.schemas.materials import Material
from app.schemas.rawmaterials import RawMaterial


class Recipe(BaseModel):
    weight: float
    material: int
    rawmaterial: int