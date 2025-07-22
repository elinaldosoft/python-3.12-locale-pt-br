FROM python:3.12

ENV DEBIAN_FRONTEND=noninteractive

# Instala dependências e ativa pt_BR.UTF-8
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        locales \
        curl \
        git \
        build-essential \
        gcc \
        libpq-dev \
    && echo "pt_BR.UTF-8 UTF-8" >> /etc/locale.gen \
    && locale-gen pt_BR.UTF-8 \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Define locale no ambiente
ENV LANG=pt_BR.UTF-8
ENV LANGUAGE=pt_BR:pt
ENV LC_ALL=pt_BR.UTF-8

# Instala Poetry
ENV POETRY_HOME="/opt/poetry"
ENV PATH="$POETRY_HOME/bin:$PATH"
RUN curl -sSL https://install.python-poetry.org | python3 - && \
    poetry config virtualenvs.create true && \
    poetry config virtualenvs.in-project true

WORKDIR /app

CMD ["/bin/bash"]
