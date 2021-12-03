from flask import Flask, request
import time 
import datetime


app = Flask(__name__)


@app.route('/', methods=['GET', 'POST'])
def hello_world():
    
    
    if request.method == 'GET':

        minute = datetime.datetime.today().second

        return 'leader, working' + str(minute)

    return 'Backend_house_scrap'


if __name__ == '__main__':
    app.run(port=5000, host='0.0.0.0', debug=True)