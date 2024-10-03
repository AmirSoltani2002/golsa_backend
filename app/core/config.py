import os
from dotenv import load_dotenv

load_dotenv()

class Settings:
    PROJECT_NAME: str = "FastAPI PostgreSQL App"
    #DATABASE_URL: str = os.getenv("DATABASE_URL")
    DATABASE_URL: str = "postgresql://postgres.bhieenrmgrupislmtels:Amir-2002-soltani@aws-0-eu-central-1.pooler.supabase.com:6543/postgres"

settings = Settings()

