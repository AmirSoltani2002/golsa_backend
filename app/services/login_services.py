from app.models.users import User
from sqlalchemy.orm import Session


def Get_user(db: Session, username: str):
    return db.query(User).filter(User.username == username).first()

