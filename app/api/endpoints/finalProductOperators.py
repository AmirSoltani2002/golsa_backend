from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from app.api.dependencies import get_db, get_current_user
from app.models.finalProduct import FinalProduct
from app.schemas.finalProducts import FinalProduct as FinalProductSchema
from app.schemas.finalProductOperator import FinalProductOperator as FinalProductOperatorSchema
from app.models.finalProductOperator import FinalProductOperator
from app.services.finalProductOperators_services import Create_finalprodOperate, Find_by_OperatorID_FinalproductID

router = APIRouter()

@router.post("/api/finalprodoperate/", response_model=FinalProductOperatorSchema)
def create_finalprod_endpoint(prod: FinalProductOperatorSchema, db: Session = Depends(get_db), user = Depends(get_current_user)):
    return Create_finalprodOperate(db=db, data=prod)

@router.get("/api/finalprodoperate/{operator_id}/{finalproduct_id}", response_model=FinalProductOperatorSchema)
def get_finalprod_endpoint(operator_id: int, finalproduct_id: int, db: Session = Depends(get_db)):
    result = Find_by_OperatorID_FinalproductID(db=db, operator_id=operator_id, finalproduct_id=finalproduct_id)
    if not result:
        raise HTTPException(status_code=404, detail="Final Product Operator not found")
    return result
