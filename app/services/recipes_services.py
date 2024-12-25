from app.models.recipes import Recipe
from app.models.materials import Material
from app.models.rawmaterials import RawMaterial
from typing import List
from sqlalchemy.orm import Session


def Create_recipes(db: Session, recipes: [dict]):
    result = []
    for data in recipes:
        recipe = Recipe(**data)
        db.add(recipe)
        db.commit()
        db.refresh(recipe)
        result.append(recipe)
    return result


def Get_recipes(db: Session):
    recipes = db.query(
        Recipe.id, 
        Material.id, 
        Material.material, 
        RawMaterial.id, 
        RawMaterial.rawmaterial, 
        RawMaterial.company, 
        Recipe.weight)\
            .join(Recipe.rawmaterial)\
                .join(Recipe.material)\
    .all()
    flattened_result = [
        {
            "کد دستور تولید": row[0],
            "کد محصول": row[1],
            "نام محصول": row[2],
            "کد ماده اولیه": row[3],
            "نام ماده اولیه": row[4],
            "شرکت تولیدی ماده اولیه": row[5],
            "وزن": row[6],
        }
        for row in recipes
    ]
    return flattened_result

