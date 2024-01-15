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
    data = response.json()
    return data

@app.route('/evil')
def evil_proxy():
    host = os.environ.get('PROXY_HOST', 'localhost')
    port = os.environ.get('PROXY_PORT', '8002')
    url = f'http://{host}:{port}'
    response = requests.get(url)
    return response

if __name__ == '__main__':
    app.run(debug=True, port=8080)

