# tests/test_main.py
from fastapi.testclient import TestClient
from app.main import app

client = TestClient(app)

def test_get_products():
    response = client.get("/product/False")
    assert response.status_code == 200
    data = response.json()
    print(data)
    return data
