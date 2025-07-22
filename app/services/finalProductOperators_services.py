from app.schemas.finalProducts import FinalProduct as FinalProductSchema
from app.models.finalProduct import FinalProduct
from app.schemas.finalProductOperator import FinalProductOperator as FinalProductOperatorSchema
from app.models import FinalProductOperator, Operator, FinalProduct, AllProduct, PipeProduct, FittingProduct, Waste
from sqlalchemy.orm import Session

def Create_finalprodOperate(db: Session, data: FinalProductOperatorSchema):
    if type(data) != dict:
        data = data.dict()
    db_data = FinalProductOperator(**data)
    db.add(db_data)
    db.commit()
    db.refresh(db_data)
    return db_data

def Find_by_OperatorID_FinalproductID(db: Session, operator_id: int, finalproduct_id: int):
    return db.query(FinalProductOperator).filter(
        FinalProductOperator.operator_id == operator_id,
        FinalProductOperator.finalproduct_id == finalproduct_id
    ).first()

def Get_FinalProductOperate(db: Session, excel = True):
    results = db.query(
        FinalProductOperator.finalproduct_id,
        Operator.name,
        FinalProductOperator.cycle_practical,
        FinalProductOperator.cycle_description,
        FinalProductOperator.start_date,
        FinalProductOperator.start_time,
        FinalProductOperator.end_date,
        FinalProductOperator.end_time,
        FinalProductOperator.shift,
        FinalProductOperator.quantity_practical,
        FinalProductOperator.waste,
        FinalProduct.type,
        FinalProduct.product_id,
        FinalProduct.cycle_tobe,
        FinalProduct.quantity_tobe,
        Waste.waste_reason,
        FinalProductOperator.waste_description
    )\
        .join(FinalProductOperator.operator)\
        .join(FinalProductOperator.finalproduct)\
        .join(FinalProductOperator.waste_reason)\
    .all()
    flattened_result = []
    if excel:
        for row in results:
            try:
                product = None
                if(row[11] == "لوله" and row[12]):
                    product = db.query(PipeProduct).filter(PipeProduct.code == row[12]).first()
                elif(row[11] == "اتصالات" and row[12]):
                    product = db.query(FittingProduct).filter(FittingProduct.code == row[12]).first()
                flattened_result.append({
                    "کد تولید": row[0],
                    "نام اپراتور": row[1],
                    "سیکل واقعی (دقیقه)": row[2],
                    "توضیحات سیکل": row[3],
                    "تاریخ شروع": row[4],
                    "زمان شروع": row[5],
                    "تاریخ پایان": row[6],
                    "زمان پایان": row[7],
                    "شیفت": row[8],
                    "تعداد تولید واقعی": row[9],
                    "تعداد ضایعات": row[10],
                    "علت ضایعات": row[15],
                    "توضیح ضایعات": row[16],
                    "تعداد اختلاف": float(row[14]) - float(row[9]) + float(row[10]) if row[14] else "",
                    "وزن ضایعات (کیلوگرم)": float(product.weight) * float(row[10]) if product else "",
                    "وزن کل تولید (کیلوگرم)": (float(row[9]) - float(row[10])) * float(product.weight) if product else ""
                })
            except Exception as e:
                print(e)
    return flattened_result
