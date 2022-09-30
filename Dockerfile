FROM python:3.10.7-alpine3.16
COPY . /app
WORKDIR /app
RUN apk add g++ make libffi-dev openssl-dev && \
    pip3 install pipenv && \
    cd /app && \
    pipenv sync --system && \
    apk del g++ make && \
    rm -rf /var/cache/apk/*
ENTRYPOINT ["./gunicorn-start.sh"]
EXPOSE 8000/tcp
