FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY main.py entrypoint.sh ./
RUN chmod +x entrypoint.sh

VOLUME ["/app/downloads", "/app/session"]

ENTRYPOINT ["./entrypoint.sh"]
