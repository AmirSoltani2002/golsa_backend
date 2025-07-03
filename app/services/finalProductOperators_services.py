from app.schemas.finalProducts import FinalProduct as FinalProductSchema
from app.models.finalProduct import FinalProduct
from app.schemas.finalProductOperator import FinalProductOperator as FinalProductOperatorSchema
from app.models.finalProductOperator import FinalProductOperator
from sqlalchemy.orm import Session

def Create_finalprodOperate(db: Session, data: FinalProductOperatorSchema):
    if type(data) != dict:
        data = data.dict()
    db_data = FinalProductOperator(**data)
    db.add(db_data)
    db.commit()
    db.refresh(db_data)
    return db_data