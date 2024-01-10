from flask import Flask, redirect
from requests import get

app = Flask(__name__)

@app.route('/test')
def health_check():
    return "it works"

@app.route('/vulns')
def vulnerability_proxy():
    get("http://app:8001/results")

@app.route('/evil')
def evil_proxy():
    """
    A function to serve a generic nginx page
    """
    get("http://nginx")

if __name__ == '__main__':
    app.run(debug=True, port=8080)

