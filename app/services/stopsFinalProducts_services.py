from sqlalchemy.orm import Session
from app.models import StopsFinalProducts, Stops, Operator
from app.schemas.stopsFinalProducts import StopsFinalProducts as StopsFinalProductsServices

def Create_stopfinalprods(db: Session, data: StopsFinalProductsServices):
    if type(data) != dict:
        data = data.dict()
    db_data = StopsFinalProducts(**data)
    db.add(db_data)
    db.commit()
    db.refresh(db_data)
    return db_data

def Get_stops(db: Session,excel = True):
    results = db.query(
        StopsFinalProducts.finalproduct_id,
        Operator.name,
        Stops.stop_reason,
        StopsFinalProducts.start_date,
        StopsFinalProducts.start_time,
        StopsFinalProducts.end_date,
        StopsFinalProducts.end_time,
        StopsFinalProducts.description
    )\
        .join(StopsFinalProducts.operator)\
        .join(StopsFinalProducts.finalproduct)\
    .all()
    flattened_result = []
    if excel:
        for row in results:
            try:
                flattened_result.append({
                    "کد تولید": row[0],
                    "نام اپراتور": row[1],
                    "دلیل توقف": row[2],
                    "تاریخ شروع": row[3],
                    "زمان شروع": row[4],
                    "تاریخ پایان": row[5],
                    "زمان پایان": row[6],
                    "توضیح توقف": row[7]
                })
            except Exception as e:
                print(e)
    return flattened_result