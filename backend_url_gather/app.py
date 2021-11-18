from flask import Flask

app = Flask(__name__)



@app.route('/')
def hello_world():
    return 'Backend_url_gather'


if __name__ == '__main__':
    app.run()