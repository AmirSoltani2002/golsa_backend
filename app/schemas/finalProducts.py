from pydantic import BaseModel, field_validator

class FinalProduct(BaseModel):
    id: int | None = None
    line_id: int | None = None
    event: str | None = None
    mold: str | None = None
    product_id: str | None = None
    type: str | None = None
    color: str | None = None
    cycle_tobe: int | None = None
    quantity_tobe: int | None = None