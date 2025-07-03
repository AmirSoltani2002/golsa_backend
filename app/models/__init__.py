# Import your models in the correct order
from app.models.pipeproducts import PipeProduct
from app.models.fittingproducts import FittingProduct
from app.models.operators import Operator  # Import Operator before MixEntry
from app.models.machines import Machine
from app.models.materials import Material
from app.models.rawmaterials import RawMaterial
from app.models.recipes import Recipe
from app.models.mixentries import MixEntry  # MixEntry references Operator
from app.models.allproducts import AllProduct
from app.models.stops import Stops
from app.models.finalProduct import FinalProduct
from app.models.stopsFinalProducts import StopsFinalProducts
from app.models.finalProductOperator import FinalProductOperator