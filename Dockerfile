FROM debian:jessie

LABEL maintainer="Haiwei Liu <carllhw@gmail.com>"

RUN groupadd -r odoo && useradd -r -g odoo odoo

RUN set -x \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
    curl \
    gcc \
    git \
    libaio-dev \
    libevent-dev \
    libjpeg-dev \
    libldap2-dev \
    libpq-dev \
    libsasl2-dev \
    libssl-dev \
    libxml2-dev \
    libxslt1-dev \
    node-clean-css \
    node-less \
    postgresql-client \
    python \
    python-dev \
    python-pip \
    ttf-wqy-zenhei \
    unzip \
    && curl -o wkhtmltox.deb -SL http://nightly.odoo.com/extra/wkhtmltox-0.12.1.2_linux-jessie-amd64.deb \
    && echo '40e8b906de658a2221b15e4e8cd82565a47d7ee8 wkhtmltox.deb' | sha1sum -c - \
    && dpkg --force-depends -i wkhtmltox.deb \
    && apt-get -y install -f --no-install-recommends \
    && rm -rf /var/lib/apt/lists/* wkhtmltox.deb
