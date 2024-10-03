from pydantic import BaseModel, validator
from datetime import date as dt
from datetime import time as tm

class MixEntry(BaseModel):
    operator_id: int
    shift: int
    line_id: int
    product_id: str
    description: str
    recipe_code: int
    time: tm
    date: dt
    fitting: bool

class MixEntryResponse(MixEntry):
    id: int