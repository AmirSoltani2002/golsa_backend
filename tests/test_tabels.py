# tests/test_main.py
from fastapi.testclient import TestClient
from app.main import app

client = TestClient(app)

def test_get_tabels():
    response = client.get("/tables/")
    assert response.status_code == 200
    data = response.json()
    #print(data)
    #return data

def test_get_columns(name = 'users'):
    response = client.get(f"/table/{name}/")
    assert response.status_code == 200
    data = response.json()
    print('ahmad', data)
    #return data

def test_get_values(name = 'pipeproduct', start = 0, end = 7, column = 'code', asc = True):
    response = client.get(f"/values/{name}/{start}/{end}/{column}/{asc}/")
    assert response.status_code == 200
    data = response.json()
    #print(data)
    #return data

def test_search_values(name = 'pipeproduct', column = 'id', content = "7", type = 'int'):
    #print(f"/table/{name}/{column}/{content}/{type}/")
    response = client.get(f"/table/{name}/{column}/{content}/{type}/")
    assert response.status_code == 200
    data = response.json()
    #print('ahmadAgha', data)
    #return data

def test_delete_values(name = 'mixentries', id = 12):
    response = client.delete(f"/table/{name}/{id}/")
    assert response.status_code == 200
    data = response.json()
    #print('asghar', data)
    #return data

def test_put_entry(name = 'mixentries', id = 13):
    data = {
        'shift': 3
    }
    response = client.put(f"/table/{name}/{id}/", json = data)
    #print('ayyyyy')
    response = response.json()
    #return response

def test_post_entry(name = 'mixentries'):
    inp = {'operator_id': 1,
    'shift': 1,
    'line_id': 1,
    'product_id': "101105030003",
    'description': 'یحیی',
    'recipe_code': 1,
    'time': '11:11:11',
    'date': '1403-10-15',
    'fitting': False}
    response = client.post(f"/table/{name}/", json = inp)
    #print('ahan')
    #return response
    
 