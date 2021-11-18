FROM python:3.8

COPY requirements.txt .

RUN pip install requirements.txt

CMD hostname -i

ENTRYPOINT ['python3', 'app.py']