# tests/test_main.py
from fastapi.testclient import TestClient
from app.main import app

client = TestClient(app)

def test_get_tabels():
    response = client.get("/api/tables/")
    assert response.status_code == 200
    data = response.json()
    #print(data)
    #return data

def test_get_columns(name = 'users'):
    response = client.get(f"/api/table/{name}/")
    assert response.status_code == 200
    data = response.json()
    print('ahmad', data)
    #return data

def test_get_values(name = 'pipeproduct', start = 0, end = 7, column = 'code', asc = True):
    response = client.get(f"/api/values/{name}/{start}/{end}/{column}/{asc}/")
    assert response.status_code == 200
    data = response.json()
    #print(data)
    #return data

def test_search_values(name = 'pipeproduct', column = 'id', content = "7", type = 'int'):
    #print(f"/table/{name}/{column}/{content}/{type}/")
    response = client.get(f"/api/table/{name}/{column}/{content}/{type}/")
    assert response.status_code == 200
    data = response.json()
    #print('ahmadAgha', data)
    #return data

def test_delete_values(name = 'materials', id = 16):
    response = client.delete(f"/api/table/{name}/{id}/")
    assert response.status_code == 200
    data = response.json()
    #print('asghar', data)
    #return data

def test_put_entry(name = 'mixentries', id = 13):
    data = {
        'shift': 3
    }
    response = client.put(f"/api/table/{name}/{id}/", json = data)
    #print('ayyyyy')
    response = response.json()
    #return response

# def test_post_entry(name = 'pipeproduct'):
#     inp = {"name": 'looloo'}
#     image_path = "asb.png"  # Path to your real test image
#     with open(image_path, "rb") as img_file:  # Keep the file open
#         file_data = {'image': ('test_image.png', img_file, 'image/png')}  # Pass the file directly# Send POST request with form data and file
#         response = client.post(f"/api/table/{name}/",json=inp,files=file_data)
#         assert response.status_code == 200

    #print('ahan')
    #return response
    
 