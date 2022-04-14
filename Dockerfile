FROM python:3.7-alpine
LABEL London App Developer Ltd

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

RUN mkdir /app
# make the app the working directory
WORKDIR /app
# copy from the local app to docker app
COPY ./app /app

# You do the following for security purposes so that we dont use the root
# add user
RUN adduser -D user
# Switch to user
USER user 