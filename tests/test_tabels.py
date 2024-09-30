# tests/test_main.py
from fastapi.testclient import TestClient
from app.main import app

client = TestClient(app)

def test_get_tabels():
    response = client.get("/tables/")
    assert response.status_code == 200
    data = response.json()
    print(data)
    return data

def test_get_columns(name = 'pipeproduct'):
    response = client.get(f"/tables/{name}/")
    assert response.status_code == 200
    data = response.json()
    print('ali', data)
    return data
