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
    time_start: tm
    time_end: tm
    date: str
    category: str
    amount: int
    
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
