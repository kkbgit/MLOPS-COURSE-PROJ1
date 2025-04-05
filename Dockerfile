FROM debian:bullseye

ENV PYTHONDONTWRITEBYTECODE = 1 \
    PYTHONUNBUFFERED = 1

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    python3-venv \
    python3-pip \
    libgomp1 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


COPY . .

RUN pip install --no-cache-dir -e .

#RUN python pipeline/training_pipeline.py

EXPOSE 5000

CMD ["python" , "application.py"]

