from flask import Flask, request

app = Flask(__name__)



@app.route('/', methods=['GET', 'POST'])
def hello_world():
    return 'Master'


if __name__ == '__main__':
    app.run(port=5005, host='0.0.0.0', debug=True)