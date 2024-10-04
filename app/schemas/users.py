from pydantic import BaseModel
from datetime import date as dt
from datetime import time as tm


class User_login(BaseModel):
    username: str
    hashed_pass: str
    role: str

class User_show(BaseModel):
    id: int
    username: str
    role: str
