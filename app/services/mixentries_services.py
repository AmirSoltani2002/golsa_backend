from sqlalchemy.orm import Session
from typing import Union
from app.schemas.mixentries import MixEntry
from app.models.mixentries import MixEntry as ME
from app.models import MixEntry, AllProduct, Operator, Machine, Recipe, Material


def Create_mixentry(db: Session, mix: MixEntry):
    if type(mix) != dict:
        mix_data = mix.dict()
    else:
        mix_data = mix
    db_mix = ME(**mix_data)
    db.add(db_mix)
    db.commit()
    db.refresh(db_mix)
    return db_mix

def Get_mixentry(db: Session):
    results = db.query(
        MixEntry.id, 
        MixEntry.shift, 
        MixEntry.description, 
        MixEntry.time, 
        MixEntry.date, 
        MixEntry.fitting,
        MixEntry.amount,
        MixEntry.recipe_code,
        Machine.id,
        Machine.machine,
        AllProduct.code,
        AllProduct.name,
        Operator.id,
        Operator.name)\
            .join(MixEntry.machine)\
            .join(MixEntry.product)\
            .join(MixEntry.operator)\
    .all()
    flattened_result = [
        {
            "کد میکسر": row[0],
            "شیفت": row[1],
            "توضیح": row[2],
            "زمان": row[3],
            "تاریخ": row[4],
            "اتصالات": row[5],
            "مقدار": row[6],
            "کد دستور تولید": row[7],
            "کد خط": row[8],
            "نام خط": row[9],
            "کد محصول": row[10],
            "نام محصول": row[11],
            "کد اپراتور": row[12],
            "نام اپراتور": row[13],
        }
        for row in results
    ]
    return flattened_result
