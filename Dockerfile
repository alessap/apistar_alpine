FROM python:3.6-alpine

COPY ./app /app
COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

WORKDIR /app

CMD ["gunicorn", "app:app"]