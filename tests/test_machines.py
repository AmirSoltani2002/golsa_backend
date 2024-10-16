# tests/test_main.py
from fastapi.testclient import TestClient
from app.main import app

client = TestClient(app)

def test_get_machine(fitting = True):
    response = client.get(f"/api/machine/{fitting}")
    assert response.status_code == 200
    data = response.json()
    #return data

