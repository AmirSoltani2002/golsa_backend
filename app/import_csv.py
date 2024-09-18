# import os
# import pandas as pd
# from sqlalchemy.orm import Session
# from app.db import engine, Base
# from app.csv_to_orm import generate_model_class_first_pass, generate_model_class_second_pass

# CSV_DIR = "csvfiles/"

# def convert_to_camel_case(name):
#     return ''.join(word.capitalize() for word in name.split('_'))

# def import_csvs():
#     session = Session(bind=engine)
#     model_classes = {}
#     foreign_key_map = {
#         'recipes': {
#             'material_id': 'materials.id',
#             'rawmaterial_id': 'rawmaterials.id'
#         },
#         'mixerentries': {
#             'operator_id': 'operators.id',
#             'line_id': 'machines.id',
#             'recipe_code': 'recipes.id'
#         }
#     }

#     # First pass: create models without relationships
#     for csv_file in os.listdir(CSV_DIR):
#         if csv_file.endswith(".csv"):
#             file_path = os.path.join(CSV_DIR, csv_file)
#             df = pd.read_csv(file_path)
#             table_name = csv_file.split(".")[0]
#             model_class = generate_model_class_first_pass(table_name, df)
#             model_classes[convert_to_camel_case(table_name.rstrip('s'))] = model_class
#             model_class.__table__.create(bind=engine, checkfirst=True)

#     # Second pass: add relationships
#     for csv_file in os.listdir(CSV_DIR):
#         if csv_file.endswith(".csv"):
#             file_path = os.path.join(CSV_DIR, csv_file)
#             df = pd.read_csv(file_path)
#             table_name = csv_file.split(".")[0]
#             generate_model_class_second_pass(model_classes, table_name, df, foreign_keys=foreign_key_map)

#     # Insert data into the database
#     for csv_file in os.listdir(CSV_DIR):
#         if csv_file.endswith(".csv"):
#             file_path = os.path.join(CSV_DIR, csv_file)
#             df = pd.read_csv(file_path)
#             table_name = csv_file.split(".")[0]
#             model_class = model_classes[convert_to_camel_case(table_name.rstrip('s'))]

#             for _, row in df.iterrows():
#                 record = model_class(**row.to_dict())
#                 session.add(record)

#             session.commit()

#     session.close()

# if __name__ == "__main__":
#     import_csvs()
