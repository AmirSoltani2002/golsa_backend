from app.models.users import User
from sqlalchemy.orm import Session
from app.schemas.users import User_login


def Get_user(db: Session, username: str):
    return db.query(User).filter(User.username == username).first()

def Create_user(db: Session, user: User_login):
    user = User(user)
    db.add(user)
    db.commit()
    db.refresh(user)
    return user
