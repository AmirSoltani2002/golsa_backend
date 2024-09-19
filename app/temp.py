import pandas as pd
from sqlalchemy import create_engine

# Database connection settings
db_url = "postgresql+psycopg2://postgres:amir2002@localhost:5432/golsa_polymer"

# Create SQLAlchemy engine
engine = create_engine(db_url)

# Read the CSV file into a pandas DataFrame
csv_file_path = './csvfiles/fittingproducts.csv'
df = pd.read_csv(csv_file_path)

# Insert data into the PostgreSQL table (replace 'your_table_name' with your actual table name)
df.to_sql('fittingproduct', con=engine, if_exists='append', index=False)