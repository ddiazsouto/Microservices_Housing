from flask import Flask, request

app = Flask(__name__)



@app.route('/', methods=['GET', 'POST'])
def hello_world():


    count += 1        
    return count

    #return 'Backend_url_gather'


if __name__ == '__main__':
    app.run(port=5500, host='0.0.0.0', debug=True)