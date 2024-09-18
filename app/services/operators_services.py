from sqlalchemy.orm import Session
from app.models.operators import Operator


def Get_operators(db: Session):
    return db.query(Operator).all()

