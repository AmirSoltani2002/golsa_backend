from pydantic import BaseModel
from datetime import date as dt
from datetime import time as tm

class RawMaterial(BaseModel):
    id: int
    rawmaterial: str
    confirm: bool = False
    company: str