import requests
from flask import Flask, redirect
from requests import get

app = Flask(__name__)

@app.route('/test')
def health_check():
    return "it works"

@app.route('/vulns')
def vulnerability_proxy():
    response = requests.get('http://app-service:8001/results')
    data = response.json()
    return data

@app.route('/evil')
def evil_proxy():
    """
    A function to serve a generic nginx page
    """
    get("http://nginx")

if __name__ == '__main__':
    app.run(debug=True, port=8080)

