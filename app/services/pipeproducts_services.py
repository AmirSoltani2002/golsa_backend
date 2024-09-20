from app.models.pipeproducts import PipeProduct
from sqlalchemy.orm import Session


def Get_pipes(db: Session):
    return db.query(PipeProduct).all()

