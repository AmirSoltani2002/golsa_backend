from pydantic import BaseModel
from datetime import date as dt
from datetime import time as tm
from app.schemas.materials import Material
from app.schemas.rawmaterials import RawMaterial
from typing import Optional


class Recipe(BaseModel):
    id: int
    material: Material
    rawmaterial: RawMaterial
    weight: float