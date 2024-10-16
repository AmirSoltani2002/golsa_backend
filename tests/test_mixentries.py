# tests/test_main.py
from fastapi.testclient import TestClient
from app.main import app

client = TestClient(app)

def test_post_mixer_entry():
    inp = {'operator_id': 1,
    'shift': 1,
    'line_id': 1,
    'product_id': "101105030003",
    'mamad':125,
    'description': 'خوبه',
    'recipe_code': 1,
    'recipe':{
        '1':10,
        '22':17.2563
    },
    'time': '11:11:11',
    'date': '1403-10-15',
    'fitting': False}
    response = client.post("/api/mixentry/", json=inp)
    assert response.status_code == 200
    data = response.json()
    #print(data)
    #return data

def test_post_mix_entry_other():
    inp = {'operator_id': 1,
    'shift': 1,
    'line_id': 1,
    'product_id': "101105030003",
    'mamad':125,
    'description': 'خوبه',
    'recipe_code': 1,
     'recipe':{
        '1':10,
        '22':17.2563
    },
    'time': '11:11:11',
    'date': '1403-10-15',
    'fitting': True}
    response = client.post("/api/mixentry/other/", json=inp)
    assert response.status_code == 200
    data = response.json()
    #print(data)
    #return data
