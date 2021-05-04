# syntax=docker/dockerfile:1
#FROM python:3
#ENV PYTHONUNBUFFERED=1
#WORKDIR /code
#COPY requirements.txt /code/
#RUN pip install -r requirements.txt
#COPY . /code/

FROM python:3.8
RUN mkdir /app
WORKDIR /app
ADD requirements.txt /app/
RUN pip install --upgrade pip && pip install -r requirements.txt
ADD . /app/
RUN python3 manage.py makemigrations
RUN python3 manage.py migrate
CMD python3 manage.py runserver 0.0.0.0:8000