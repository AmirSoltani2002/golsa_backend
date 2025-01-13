from sqlalchemy.orm import Session
from typing import Union, List
from app.schemas.mixentries import MixEntry
from app.models.mixentries import MixEntry as ME
from app.models.rawmaterials import RawMaterial as RM
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
    materials = db.query(RM.id, RM.rawmaterial, RM.company).all()
    results = db.query(
        MixEntry.id, 
        MixEntry.shift, 
        MixEntry.description, 
        MixEntry.time, 
        MixEntry.date, 
        MixEntry.category,
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
    flattened_result = []
    for row in results:
        recipe = {}
        for material in materials:
            recipe[material[0]] = 0
        self_recipe: List[Recipe] = db.query(Recipe).where(Recipe.material_id == row[7]).all()
        for ins in self_recipe:
            recipe[ins.rawmaterial_id] = ins.weight
        for material in materials:
            recipe[material[1] + ' ' + material[2]] = recipe.pop(material[0])
        flattened_result.append({**{
            "کد دستور تولید": row[7],
            "شیفت": row[1],
            "توضیح": row[2],
            "زمان": row[3],
            "تاریخ": row[4],
            "کتگوری": row[5],
            "مقدار": row[6],
            "کد خط": row[8],
            "نام خط": row[9],
            "کد محصول": row[10],
            "نام محصول": row[11],
            "کد اپراتور": row[12],
            "نام اپراتور": row[13],
        }, **recipe})
        
    return flattened_result
