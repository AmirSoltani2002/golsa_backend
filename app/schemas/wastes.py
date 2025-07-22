from pydantic import BaseModel

class Waste(BaseModel):
    id: int | None = None
    waste_reason: str | None = None