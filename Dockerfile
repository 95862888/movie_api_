FROM python:3.10-slim AS compile-image

COPY requirements.txt .

RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

FROM python:3.10-slim AS build-image

COPY --from=compile-image /usr/local/lib/python3.10/site-packages /usr/local/lib/python3.10/site-packages

WORKDIR /app
COPY . /app

CMD ["sh", "-c", "python -m alembic upgrade head && python3 main.py "]
