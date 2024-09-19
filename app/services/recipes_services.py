from app.models.recipes import Recipe
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

