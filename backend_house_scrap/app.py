from flask import Flask, request
import time 


app = Flask(__name__)

count = 0


@app.route('/', methods=['GET', 'POST'])
def hello_world():
    
    
    if request.method == 'GET':
        return 'leader, working'

    return 'Backend_house_scrap'


if __name__ == '__main__':
    app.run(port=5000, host='0.0.0.0', debug=True)