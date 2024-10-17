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
        RawMaterial.company)\
            .join(Recipe.rawmaterial)\
                .join(Recipe.material)\
    .all()
    flattened_result = [
        {
            "recipe_id": row[0],
            "material_id": row[1],
            "material_name": row[2],
            "rawmaterial_id": row[3],
            "rawmaterial_name": row[4],
            "rawmaterial_company": row[5],
        }
        for row in recipes
    ]
    return flattened_result

