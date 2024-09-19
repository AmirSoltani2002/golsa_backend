from pydantic import BaseModel
from datetime import date as dt
from typing import List, Optional
from datetime import time as tm
from app.schemas.rawmaterials import RawMaterial

class Material(BaseModel):
    id: int
    material: Optional[str] = None


class MaterialWithRawMaterial(BaseModel):
    rawmaterial: RawMaterial
    weight: float
