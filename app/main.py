from fastapi import FastAPI
from app.api.endpoints import mixentries
from app.api.endpoints import materials
from app.api.endpoints import operators
from app.api.endpoints import machines
from app.core.config import settings
from app.db import Base
from app.db import engine

# Import your models in the correct order
from app.models.operators import Operator  # Import Operator before MixEntry
from app.models.machines import Machine
from app.models.materials import Material
from app.models.rawmaterials import RawMaterial
from app.models.recipes import Recipe
from app.models.mixentries import MixEntry  # MixEntry references Operator

# Initialize the FastAPI app
app = FastAPI(title=settings.PROJECT_NAME)

# Create all database tables in the correct order
Base.metadata.create_all(bind=engine)

# Include API routes
app.include_router(mixentries.router)
app.include_router(materials.router)
app.include_router(operators.router)
app.include_router(machines.router)
@app.get("/")
def read_root():
    return {"message": "Welcome to the FastAPI app!"}
