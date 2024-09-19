from sqlalchemy.orm import Session
from typing import Union
from app.schemas.mixentries import MixEntry
from app.models.mixentries import MixEntry as ME


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

