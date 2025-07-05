from app.schemas.finalProducts import FinalProduct as FinalProductSchema
from app.models import FinalProduct, PipeProduct, FittingProduct, Machine, AllProduct
from sqlalchemy.orm import Session

def Create_finalprod(db: Session, data: FinalProductSchema):
    if type(data) != dict:
        data = data.dict()
    db_data = FinalProduct(**data)
    db.add(db_data)
    db.commit()
    db.refresh(db_data)
    return db_data

def update_finalprod(db: Session, id: int, data: FinalProductSchema):
    if type(data) != dict:
        data = data.dict()
    db_data = db.query(FinalProduct).filter(FinalProduct.id == id).first()
    if db_data:
        for key, value in data.items():
            if key == "id":
                continue
            setattr(db_data, key, value)
        db.commit()
        db.refresh(db_data)
    return db_data

def Get_finalProduct(db: Session, excel = True):
    results = db.query(
        FinalProduct.id,
        Machine.machine,
        FinalProduct.mold,
        AllProduct.name,
        FinalProduct.product_id,
        FinalProduct.type,
        FinalProduct.cycle_tobe,
        FinalProduct.quantity_tobe,
    )\
        .join(FinalProduct.machine)\
        .join(FinalProduct.product)\
    .all()
    flattened_result = []
    if excel:
        for row in results:
            product = None
            if row[5] == "لوله":
                product = db.query(PipeProduct).filter(PipeProduct.code == row[4]).first()
            elif row[5] == "اتصالات":
                product = db.query(FittingProduct).filter(FittingProduct.code == row[4]).first()
            flattened_result.append({
                "کد تولید": row[0],
                "دستگاه": row[1],
                "قالب": row[2],
                "نام محصول": row[3],
                "کد محصول": row[4],
                "رنگ": product.color if product else "",
                "وزن واحد (کیلوگرم)": product.weight if product else "",
                "نوع محصول": row[5],
                "سیکل اسمی (دقیقه)": row[6],
                "تعداد تولید اسمی": row[7],
                "وزن کل اسمی (کیلوگرم)": float(row[7]) * float(product.weight) if product else ""
            })
        return flattened_result
