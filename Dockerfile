FROM python:3.12

# Evita prompts interativos
ENV DEBIAN_FRONTEND=noninteractive

# Instala locales e dependências mínimas
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        locales \
        curl \
        git \
        build-essential \
        gcc \
        libpq-dev \
    && locale-gen pt_BR.UTF-8 \
    && update-locale LANG=pt_BR.UTF-8 \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Define locale padrão
ENV LANG=pt_BR.UTF-8
ENV LANGUAGE=pt_BR.UTF-8
ENV LC_ALL=pt_BR.UTF-8

# Instala Poetry
ENV POETRY_HOME="/opt/poetry"
ENV PATH="$POETRY_HOME/bin:$PATH"
RUN curl -sSL https://install.python-poetry.org | python3 - && \
    poetry config virtualenvs.create true && \
    poetry config virtualenvs.in-project true

# Define diretório de trabalho (usado por quem herdar a imagem)
WORKDIR /app

# Entrada padrão da imagem (ajustável no projeto que a usar)
CMD ["/bin/bash"]
