from sqlalchemy.orm import Session
from app.models.machines import Machine


def Get_machines(db: Session, category: str):
    return db.query(Machine).filter(Machine.category == category).all()

