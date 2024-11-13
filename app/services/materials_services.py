from sqlalchemy.orm import Session
from app.models.materials import Material
from app.models.recipes import Recipe



def Get_materials(db: Session):
    return db.query(Material).filter(Material.material != None).all()

def Get_material_by_id(id: int, db: Session):
    return db.query(Recipe).filter(Recipe.material_id == id and Recipe.rawmaterial_id != None).all()

def Post_material(db: Session, material: str = None):
    db_material = Material(material = material)
    db.add(db_material)
    db.commit()
    db.refresh(db_material)
    return db_material