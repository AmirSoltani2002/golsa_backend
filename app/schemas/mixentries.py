from pydantic import BaseModel, field_validator
import jdatetime
from datetime import date as dt
from datetime import time as tm

class MixEntry(BaseModel):
    operator_id: int = None
    shift: int = None
    line_id: int = None
    product_id: str = None
    description: str = None
    recipe_code: int = None
    date: str = None
    category: str = None
    amount: int   = None
    stop_id: int = None  
    stop_time: int = None
    time: int = None
    mainstat: bool = None

    @field_validator('operator_id', 'shift', 'line_id', 'recipe_code', 'amount', 'stop_id', 'stop_time', 'time')
    @classmethod
    def non_negative_validator(cls, v):
        if v < 0:
            raise ValueError("Value must be non-negative")
        return v
    # @validator('date', pre=True)
    # def parse_persian_date(cls, value):
    #     try:
    #         # Ensure the input value is a string
    #         if not isinstance(value, str):
    #             value = str(value)
    #         # Assume value is in the format 'YYYY-MM-DD' in Persian calendar
    #         persian_date = jdatetime.date.fromisoformat(value)
    #         # Convert to Gregorian date
    #         gregorian_date = persian_date.togregorian()
    #         return gregorian_date
    #     except Exception as e:
    #         raise e
