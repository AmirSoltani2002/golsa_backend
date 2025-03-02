from sqlalchemy.orm import Session
from typing import Union, List
from app.schemas.mixentries import MixEntry
from app.models.mixentries import MixEntry as ME
from app.models.rawmaterials import RawMaterial as RM
from app.models import MixEntry, AllProduct, Operator, Machine, Recipe, Material, PipeProduct, FittingProduct



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

def Get_mixentry(db: Session, type: str):
    materials = db.query(RM.id, RM.rawmaterial, RM.company).all()
    results = db.query(
        MixEntry.id, 
        MixEntry.shift, 
        MixEntry.description, 
        MixEntry.time_start, 
        MixEntry.time_end,
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
        product = db.query(PipeProduct).filter(PipeProduct.code == row[11]).first()
        if not product:
            product = db.query(FittingProduct).filter(FittingProduct.code == row[11]).first()
        self_recipe: List[Recipe] = db.query(Recipe).where(Recipe.material_id == row[8]).all()
        # if not row[6]:
        #     row[6] = 0
        for ins in self_recipe:
            recipe[ins.rawmaterial_id] = ins.weight * float(row[7]) if type == "total" else ins.weight
        for material in materials:
            recipe[material[1] + ' ' + material[2]] = recipe.pop(material[0])
        
        flattened_result.append({**{
            "کد محصول": row[11],
            "نام محصول": row[12],
            "رنگ": product.color,
            "کتگوری": row[6],
            "نام خط تولید": row[10],
            "نام اپراتور": row[14],
            "شیفت": row[1],
            "تاریخ": row[5],
            "زمان شروع": row[3],
            "زمان پایان": row[4],
            "تعداد میکس": row[7],
            "توضیح": row[2],
        }, **recipe})
        
    return flattened_result
