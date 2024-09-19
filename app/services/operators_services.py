from sqlalchemy.orm import Session
from app.models.operators import Operator


def Get_operators(db: Session, fitting: bool):
    return db.query(Operator).filter(Operator.fitting == fitting).all()