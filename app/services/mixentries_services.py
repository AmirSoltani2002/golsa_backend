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
    return db.query(MixEntry).\
        join(AllProduct, MixEntry.product_id == AllProduct.code).\
        join(Operator, MixEntry.operator_id == Operator.id).\
        join(Machine, MixEntry.line_id == Machine.id).\
        join(Material, MixEntry.recipe_code == Material.id).\
        all()
