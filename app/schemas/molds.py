from pydantic import BaseModel

class Molds(BaseModel):
    id: int
    mold: str