import sys
sys.path.append("/mount/src/golsa_backend")
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
#from supabase import create_client, Client
from app.api.endpoints import mixentries, materials, operators, machines, products, tables, login
from app.core.config import settings
from app.db import Base
from app.db import engine
from fastapi.staticfiles import StaticFiles

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

app.mount("/static", StaticFiles(directory="/home/webapp/golsa_backend/images"), name="static")
# url = "https://bhieenrmgrupislmtels.supabase.co"
# key = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJoaWVlbnJtZ3J1cGlzbG10ZWxzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mjc5NDQ2MzAsImV4cCI6MjA0MzUyMDYzMH0.gmyyxwP_GC8_khjatC_MDZhT2_E9AapMkFPX9JiWdG0"
# supabase: Client = create_client(url, key)

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
@app.get("/api/")
def read_root():
    return {"message": "Welcome to the FastAPI app!"}
