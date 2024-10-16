from sqlalchemy.orm import Session
from app.models.operators import Operator


def Get_operators(db: Session, type: str):
    return db.query(Operator).filter(Operator.type == type).all()