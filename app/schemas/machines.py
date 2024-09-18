from pydantic import BaseModel
from datetime import date as dt
from datetime import time as tm

class Machine(BaseModel):
    id: int
    machine: str
    fitting: bool
