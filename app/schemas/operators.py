from pydantic import BaseModel
from datetime import date as dt
from datetime import time as tm

class Operator(BaseModel):
    id: int
    name: str
    father: str
    sex: bool  # ForeignKey reference
    personal_id: str  # ForeignKey reference
    marriage: bool # ForeignKey reference
    education: str  # ForeignKey reference
    major: str  # ForeignKey reference
    part: str  # ForeignKey reference
    fitting: bool # ForeignKey reference
