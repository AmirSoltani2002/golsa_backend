from sqlalchemy.orm import Session
from app.models.operators import Operator


def Get_operators(db: Session, type: str, flag: bool):
    if flag:
        return db.query(Operator).filter(Operator.type != type).all()
    return db.query(Operator).filter(Operator.type == type).all()