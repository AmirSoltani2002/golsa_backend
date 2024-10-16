# tests/test_main.py
from fastapi.testclient import TestClient
from app.main import app

client = TestClient(app)

def test_get_material(fitting = True):
    response = client.get(f"/api/operator/{fitting}")
    assert response.status_code == 200
    data = response.json()
    #print(data)
    #return data
