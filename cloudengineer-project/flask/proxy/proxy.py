import os, requests
from flask import Flask, redirect
from requests import get

app = Flask(__name__)

@app.route('/test')
def health_check():
    return "it works"

@app.route('/vulns')
def vulnerability_proxy():
    host = os.environ.get('APP_HOST', 'localhost')
    port = os.environ.get('APP_PORT', '8001')
    url = f'http://{host}:{port}/results'
    response = requests.get(url)
    print(response)
    data = response.json()
    return data

@app.route('/evil')
def evil_proxy():
    response = requests.get("http://nginx-project:8002")
    return response.text

if __name__ == '__main__':
    app.run(debug=True, port=8080)

