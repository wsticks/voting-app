FROM python:3.9.20-slim-bookworm

RUN apt-get update \
    && apt-get install -y --no-install-recommends apache2-utils \
    && rm -rf /var/lib/apt/lists/* \
    && groupadd --gid 10001 app \
    && useradd --uid 10001 --gid 10001 --create-home --shell /usr/sbin/nologin app

WORKDIR /seed

COPY . .

RUN python make-data.py \
    && chmod +x /seed/generate-votes.sh \
    && chown -R app:app /seed

USER app

CMD ["/seed/generate-votes.sh"]
