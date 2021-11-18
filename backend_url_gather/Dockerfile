FROM python:3.8

WORKDIR .

COPY requirements.txt .

RUN pip3 --version

RUN pip3 install -r requirements.txt

RUN . .

CMD hostname -i

ENTRYPOINT ['python3', 'app.py']