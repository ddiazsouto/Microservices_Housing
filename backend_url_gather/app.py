from flask import Flask, request
import time

app = Flask(__name__)



@app.route('/', methods=['GET', 'POST'])
def hello_world():
    if request.method == 'GET':

        minute = datetime.datetime.today().second

        return 'url_gather, working' + minute

    return 'Backend_url_gather'


if __name__ == '__main__':
    app.run(port=5500, host='0.0.0.0', debug=True)