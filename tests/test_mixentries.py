# tests/test_main.py
from fastapi.testclient import TestClient
from app.main import app

client = TestClient(app)

def test_post_mixer_entry():
    inp = {'operator_id': 1,
    'shift': 1,
    'line_id': 1,
    'product_id': 1,
    'description': 'خوبه',
    'recipe_code': 1,
    'time': '11:11:11',
    'date': '1403-10-10',
    'fitting': True}
    response = client.post("/mixentry/", json=inp)
    assert response.status_code == 200
    data = response.json()
    print(data)
    return data

# def test_invalid_user():
#     # Missing required 'email' field
#     response = client.post("/users/", json={"name": "Jane Doe"})
#     assert response.status_code == 422  # 422 Unprocessable Entity for validation errors
