import sys
sys.path.append("/mount/src/golsa_backend")
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from app.api.endpoints import mixentries, materials, operators, machines, products, tables, login, recipes, finalProductOperators, finalProducts, stopsFinalProducts
from app.core.config import settings
from app.db import Base
from app.db import engine
from fastapi.staticfiles import StaticFiles
from app.models import PipeProduct, FittingProduct, Operator, Machine, Material, RawMaterial, Recipe, MixEntry, AllProduct, Stops, FinalProduct, StopsFinalProducts, FinalProductOperator

app = FastAPI(title=settings.PROJECT_NAME)

app.mount("/api/static", StaticFiles(directory="images"), name="static")

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Replace with the origins you want to allow
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
app.include_router(recipes.router)
app.include_router(finalProductOperators.router)
app.include_router(finalProducts.router)
app.include_router(stopsFinalProducts.router)
@app.get("/api/")
def read_root():
    return {"message": "Welcome to the FastAPI app!"}
