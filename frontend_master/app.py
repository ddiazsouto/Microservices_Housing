from flask import Flask, request
import time
import requests


app = Flask(__name__)



@app.route('/', methods=['GET', 'POST'])
def hello_world():

    x = y = 0

    time.sleep(5)

    while(x == 9 and y == 9):
        x = requests.get(http://localhost:5500/) #.json()
        y = requests.get(http://localhost:5000/) #.json()
        return x, y

    return 'Master'


if __name__ == '__main__':
    app.run(port=5005, host='0.0.0.0', debug=True)