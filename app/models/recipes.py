from sqlalchemy import Column, Integer, String, ForeignKey, Float
from sqlalchemy.orm import relationship
from app.db import Base
from app.models.operators import Operator  # Import Operator before MixEntry
from app.models.machines import Machine
from app.models.materials import Material
from app.models.rawmaterials import RawMaterial


class Recipe(Base):
    __tablename__ = 'recipes'

    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    weight = Column(Float)
    material_id = Column(Integer, ForeignKey('materials.id', ondelete='SET NULL'))
    rawmaterial_id = Column(Integer, ForeignKey('rawmaterials.id', ondelete='SET NULL'))  # ForeignKey reference
    mixEntries_id = Column(Integer, ForeignKey('mixentries.id', ondelete='SET NULL'))

    material = relationship("Material", backref="recipes")
    rawmaterial = relationship("RawMaterial", backref="recipes")

