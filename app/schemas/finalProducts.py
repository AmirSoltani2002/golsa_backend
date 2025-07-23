from pydantic import BaseModel, field_validator

class FinalProduct(BaseModel):
    id: int | None = None
    line_id: int | None = None
    mold_id: int | None = None
    product_id: int | None = None
    type: str | None = None
    cycle_tobe: int | None = None
    quantity_tobe: int | None = None