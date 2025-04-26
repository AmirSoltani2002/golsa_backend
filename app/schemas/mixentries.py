from pydantic import BaseModel, validator
import jdatetime
from datetime import date as dt
from datetime import time as tm

class MixEntry(BaseModel):
    operator_id: int
    shift: int
    line_id: int
    product_id: str
    description: str
    recipe_code: int
    date: str
    category: str
    amount: int  
    stop_id: int  
    stop_time: int
    time: int
    @validator('operator_id', 'shift', 'line_id', 'recipe_code', 'amount', 'stop_id', 'stop_time', 'time')
    def non_negative_validator(cls, v, field):
        if v < 0:
            raise ValueError(f"{field.name} must be non-negative")
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
