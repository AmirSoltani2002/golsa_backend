# tests/test_main.py
from fastapi.testclient import TestClient
from app.main import app

client = TestClient(app)

def test_get_recipes():
    response = client.get(f"/api/recipes/")
    assert response.status_code == 200
    data = response.json()
    print(data)
    #print(data)
    #return data
