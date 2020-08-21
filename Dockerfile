FROM alpine:3.9 as intermediate

RUN apk update && \
    apk add --no-cache python3 python3-dev make gcc g++ make libffi-dev openssl-dev

WORKDIR /app

COPY requirements.txt ./

RUN python3 -m venv venv && \
    venv/bin/pip install --upgrade pip setuptools && \
    venv/bin/pip install -r requirements.txt

FROM alpine:3.9

RUN apk update && \
    apk add --no-cache python3

COPY --from=intermediate /app/venv /app/venv

WORKDIR /app

COPY *.py ./

ENTRYPOINT ["venv/bin/gunicorn"]
CMD ["--workers", "2", "-b", "0.0.0.0:5000", "wsgi:app"]
