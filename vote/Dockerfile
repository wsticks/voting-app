# Pinned so a later rebuild does not silently pick up a new Debian.
FROM python:3.11.11-slim-bookworm AS base

RUN apt-get update && \
    apt-get install -y --no-install-recommends curl && \
    rm -rf /var/lib/apt/lists/* && \
    groupadd --gid 10001 app && \
    useradd --uid 10001 --gid 10001 --create-home --shell /usr/sbin/nologin app

WORKDIR /usr/local/app

COPY requirements.txt ./requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Used by docker compose on my laptop. Stays root so the bind mount is writable.
FROM base AS dev
RUN pip install --no-cache-dir watchdog
ENV FLASK_ENV=development
CMD ["python", "app.py"]

FROM base AS final

COPY . .
RUN chown -R app:app /usr/local/app

EXPOSE 8080

USER app

# Port 80 needs root. 8080 does not.
CMD ["gunicorn", "app:app", "-b", "0.0.0.0:8080", "--log-file", "-", "--access-logfile", "-", "--workers", "4", "--keep-alive", "0"]
