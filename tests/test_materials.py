# tests/test_main.py
from fastapi.testclient import TestClient
from app.main import app

client = TestClient(app)

def test_get_material():
    response = client.get("/materials/")
    assert response.status_code == 200
    data = response.json()
    #print(data)
    assert data

def test_get_material_by_id(id = 2):
    response = client.get(f"/material/{id}/")
    assert response.status_code == 200
    data = response.json()
    #print(data)
    #return data

# def test_invalid_user():
#     # Missing required 'email' field
#     response = client.post("/users/", json={"name": "Jane Doe"})
#     assert response.status_code == 422  # 422 Unprocessable Entity for validation errors
