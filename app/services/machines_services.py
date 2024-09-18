from sqlalchemy.orm import Session
from app.models.machines import Machine


def Get_machines(db: Session):
    return db.query(Machine).all()

