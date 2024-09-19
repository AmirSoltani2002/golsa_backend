from pydantic import BaseModel
from datetime import date as dt
from datetime import time as tm

class Product(BaseModel):
    code: str
    name: str