FROM python:3.9.7-alpine3.14
COPY . /app
WORKDIR /app
RUN apk add g++ make libffi-dev openssl-dev python3-dev && \
    pip3 install pipenv && \
    cd /app && \
    pipenv install && \
    apk del g++ make && \
    rm -rf /var/cache/apk/*
ENTRYPOINT ["./gunicorn-start.sh"]
EXPOSE 8000/tcp
