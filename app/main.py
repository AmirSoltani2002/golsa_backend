import sys
sys.path.append("/mount/src/golsa_backend")
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from app.api.endpoints import mixentries, materials, operators, machines, products, tables, login
from app.core.config import settings
from app.db import Base
from app.db import engine

# Import your models in the correct order
from app.models import PipeProduct, FittingProduct, Operator, Machine, Material, RawMaterial, Recipe, MixEntry, AllProduct
# from app.models.fittingproducts import FittingProduct
# from app.models.operators import Operator  # Import Operator before MixEntry
# from app.models.machines import Machine
# from app.models.materials import Material
# from app.models.rawmaterials import RawMaterial
# from app.models.recipes import Recipe
# from app.models.mixentries import MixEntry  # MixEntry references Operator
# from app.models.allproducts import AllProduct

# Initialize the FastAPI app
app = FastAPI(title=settings.PROJECT_NAME)

app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:3000"],  # Replace with the origins you want to allow
    allow_credentials=True,
    allow_methods=["*"],  # Allows all HTTP methods
    allow_headers=["*"],  # Allows all headers
)

# Create all database tables in the correct order
Base.metadata.create_all(bind=engine)

# Include API routes
app.include_router(mixentries.router)
app.include_router(materials.router)
app.include_router(operators.router)
app.include_router(machines.router)
app.include_router(products.router)
app.include_router(tables.router)
app.include_router(login.router)
@app.get("/")
def read_root():
    return {"message": "Welcome to the FastAPI app!"}
