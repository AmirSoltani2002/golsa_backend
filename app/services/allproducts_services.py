from sqlalchemy.orm import Session
from app.models.allproducts import AllProduct

def Get_all_prods(db: Session, code: str):
    return db.query(AllProduct).filter(AllProduct.code == code).first()

