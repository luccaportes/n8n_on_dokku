ARG N8N_VERSION="1.98.2"

FROM n8nio/n8n:${N8N_VERSION}

USER root

RUN apk add --no-cache chromium nss \
    && npm install -g puppeteer \
    && npm cache clean --force

ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

# USER node

COPY ./entrypoint.sh /custom-entrypoint.sh

ENV SHELL /bin/sh
USER node

ENTRYPOINT ["/custom-entrypoint.sh"]
