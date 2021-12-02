from flask import Flask, request

app = Flask(__name__)



@app.route('/', methods=['GET', 'POST'])
def hello_world():
    return 'Backend_house_scrap'


if __name__ == '__main__':
    app.run(port=5000, host='0.0.0.0', debug=True)