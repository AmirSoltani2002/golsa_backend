# from sqlalchemy import Date, Time, DateTime, Column, Integer, String, Float, ForeignKey
# from sqlalchemy.orm import relationship
# from app.db import Base, engine
# import pandas as pd
# from sqlalchemy import inspect

# # Map pandas data types to SQLAlchemy data types
# def map_dtype_to_sqlalchemy(pandas_dtype, series=None):
#     """
#     Map pandas data types to SQLAlchemy data types.
    
#     Args:
#         pandas_dtype: The pandas dtype to map.
#         series: The pandas series for checking specific values (used for time detection).
    
#     Returns:
#         The SQLAlchemy type corresponding to the pandas dtype.
#     """
#     if pd.api.types.is_integer_dtype(pandas_dtype):
#         return Integer
#     elif pd.api.types.is_float_dtype(pandas_dtype):
#         return Float
#     elif pd.api.types.is_string_dtype(pandas_dtype):
#         return String
#     elif pd.api.types.is_datetime64_any_dtype(pandas_dtype):
#         # If the dtype is datetime, we check if it's specifically a date or time
#         if series is not None and all(series.dt.time == pd.Timestamp(0).time()):
#             return Date
#         else:
#             return DateTime
#     elif series is not None and series.apply(lambda x: isinstance(x, str) and ':' in x).all():
#         # If the values in the column are strings containing ':', it might be time
#         return Time
#     else:
#         return String  # Default to String if unknown

# def convert_to_camel_case(name):
#     return ''.join(word.capitalize() for word in name.split('_'))

# def generate_model_class_first_pass(table_name, df, foreign_keys=None):
#     """
#     First pass: Create the model class with columns and foreign key constraints.
#     """
#     class_name = convert_to_camel_case(table_name.rstrip('s'))
#     print(f"First pass for generating model class: {class_name}")

#     columns = {
#         '__tablename__': table_name,
#         'id': Column(Integer, primary_key=True, autoincrement=True)
#     }

#     fk = foreign_keys.get(table_name) if foreign_keys else {}

#     for col_name, dtype in df.dtypes.items():
#         sqlalchemy_type = map_dtype_to_sqlalchemy(dtype, df[col_name])

#         if col_name in fk:
#             target_table, target_column = fk[col_name].split('.')
#             columns[col_name] = Column(Integer, ForeignKey(f'{target_table}.{target_column}'))
#         else:
#             columns[col_name] = Column(sqlalchemy_type)

#     model_class = type(class_name, (Base,), columns)
#     return model_class

# def generate_model_class_second_pass(model_classes, table_name, df, foreign_keys=None):
#     """
#     Second pass: Add relationships to the model classes.
#     """
#     class_name = convert_to_camel_case(table_name.rstrip('s'))
#     model_class = model_classes[class_name]

#     fk = foreign_keys.get(table_name) if foreign_keys else {}
#     relationships = {}
#     if fk:
#         for col_name in df.columns:
#             if col_name in fk:
#                 target_table, target_column = fk[col_name].split('.')
#                 target_class = model_classes[convert_to_camel_case(target_table.rstrip('s'))]

#                 # Define the relationship
#                 relationship_name = convert_to_camel_case(target_table.rstrip('s'))
#                 relationships[relationship_name] = relationship(target_class, backref=table_name)

#     # Add relationships to the class after it's fully defined
#     for rel_name, rel in relationships.items():
#         setattr(model_class, rel_name, rel)


