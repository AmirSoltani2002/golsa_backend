from app.schemas.finalProducts import FinalProduct as FinalProductSchema
from app.models.finalProduct import FinalProduct
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