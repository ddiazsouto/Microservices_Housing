from flask import Flask, request
import time
import datetime
import requests


app = Flask(__name__)


@app.route('/', methods=['GET', 'POST'])
def hello_world():


    #x = requests.get('http://10.0.2.15:5500/').text #.json()
    #y = requests.get('http://10.0.2.15:5000/').text #.json()

    with open('IPs.txt', 'r') as f:
        var = f.readlines()

    return str(var)


if __name__ == '__main__':
    app.run(port=5005, host='0.0.0.0', debug=True)