from sqlalchemy.orm import Session
from app.models.machines import Machine


def Get_machines(db: Session, fitting: bool):
    return db.query(Machine).filter(Machine.fitting == fitting).all()

