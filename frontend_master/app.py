from flask import Flask, request
import time
import datetime
import requests


app = Flask(__name__)


@app.route('/', methods=['GET', 'POST'])
def hello_world():


    x = requests.get('http://localhost:5500/') #.json()
    y = requests.get('http://localhost:5000/') #.json()


    return str(x + '\n' + y)


if __name__ == '__main__':
    app.run(port=5005, host='0.0.0.0', debug=True)