from pydantic import BaseModel

class StopsFinalProducts(BaseModel):
    id: int | None = None
    stop_id: int | None = None
    finalproduct_id: int | None = None
    start_date: str | None = None
    start_time: str | None = None
    end_date: str | None = None
    end_time: str | None = None
    description: str | None = None
    operator_id: int | None = None