from fastapi import FastAPI, Depends, HTTPException
from fastapi.security import OAuth2PasswordRequestForm
from sqlalchemy.orm import Session
from passlib.context import CryptContext
from fastapi import APIRouter, Depends, HTTPException
from typing import List
from app.api.dependencies import get_db, create_access_token, get_current_user
from app.services.login_services import Get_user, Create_user
from app.schemas import users as user_schemas

router = APIRouter()

pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")

def verify_password(plain_password, hashed_password):
    return pwd_context.verify(plain_password,  hashed_password)

@router.post('/token')
def login(form_data: OAuth2PasswordRequestForm = Depends(), db: Session = Depends(get_db)):
    user = Get_user(db, form_data.username)
    if (not user) or (not verify_password(form_data.password, user.hashed_pass)):
        raise HTTPException(
            status_code=401,
            detail="Incorrect username or password",
            headers={"WWW-Authenticate": "Bearer"},
        )
    access_token = create_access_token(data = {"sub": user.username, "role": user.role})
    return {"access_token": access_token, "type": "bearer", "role": user.role, "username": user.username}

@router.post("/signup/", response_model=user_schemas.User_show)
def signup(data: user_schemas.User_login, db: Session = Depends(get_db), user = Depends(get_current_user)):
    if user['role'] != 'admin':
        raise HTTPException(status_code=403, detail="Not enough permission")
    return 1
    data.hashed_pass = pwd_context.hash(data.hashed_pass)
    return Create_user(db, data)