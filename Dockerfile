FROM python:3.6-alpine

COPY ./app /app
COPY run.py run.py
COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

WORKDIR /app

EXPOSE 5000

CMD ["gunicorn", "-b", ":5000","app:app"]