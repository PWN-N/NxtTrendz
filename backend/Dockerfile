FROM python:3.12-slim

ENV PYTHONBUFFERED=1

WORKDIR /app

COPY requirements.txt .
RUN python -m pip install \
    --no-cache-dir \
    --default-timeout=30 \
    --retries=2 \
    -r requirements.txt
COPY . .

CMD [ "python", "manage.py", "runserver", "0.0.0.0:8000"]