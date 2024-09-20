from sqlalchemy.orm import Session
from app.models.fittingproducts import FittingProduct


def Get_fittings(db: Session):
    return db.query(FittingProduct).all()

