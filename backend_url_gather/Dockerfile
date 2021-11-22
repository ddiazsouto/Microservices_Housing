FROM python:3.8

WORKDIR .

COPY requirements.txt .

RUN pip3 --version

RUN pip3 install -r requirements.txt

COPY . .

CMD hostname -i

EXPOSE 5500

ENTRYPOINT ["python", "app.py"]