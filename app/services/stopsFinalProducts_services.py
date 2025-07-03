from sqlalchemy.orm import Session
from app.models.stopsFinalProducts import StopsFinalProducts
from app.schemas.stopsFinalProducts import StopsFinalProducts as StopsFinalProductsServices

def Create_stopfinalprods(db: Session, data: StopsFinalProductsServices):
    if type(data) != dict:
        data = data.dict()
    db_data = StopsFinalProducts(**data)
    db.add(db_data)
    db.commit()
    db.refresh(db_data)
    return db_data