from sqlalchemy.orm import Session
from app.models.materials import Material
from app.models.recipes import Recipe



def Get_materials(db: Session):
    return db.query(Material).all()

def Get_material_by_id(id: int, db: Session):
    return db.query(Recipe).filter(Recipe.material_id == id).all()

