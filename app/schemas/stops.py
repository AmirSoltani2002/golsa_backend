from pydantic import BaseModel

class Stops(BaseModel):
    id: int
    stop_reason: str