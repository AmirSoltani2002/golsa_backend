from pydantic import BaseModel
from datetime import date as dt
from datetime import time as tm

class Operator(BaseModel):
    id: int
    name: str
    type: str # ForeignKey reference
