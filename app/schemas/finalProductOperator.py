from pydantic import BaseModel, field_validator

class FinalProductOperator(BaseModel):
    id: int | None = None
    finalproduct_id: int | None = None
    cycle_practical: int | None = None
    cycle_description: str | None = None
    operator_id: int | None = None
    start_date: str | None = None
    start_time: str | None = None
    end_date: str | None = None
    end_time: str | None = None
    shift: int | None = None
    quantity_practical: int | None = None
    waste: int | None = None
    waste_description: str | None = None