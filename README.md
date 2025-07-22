# 🐍 python-3.12-locale-pt-br

Imagem Docker personalizada baseada em **Python 3.12** com o **locale `pt_BR.UTF-8` configurado** e **Poetry pré-instalado**.

Ideal para projetos Python brasileiros que exigem:

- Formatação correta de datas, moedas e números no padrão brasileiro
- Ambientes de CI/CD com locale consistente
- Suporte total a testes, lint e empacotamento com `poetry`, `pytest`, `pylint`, etc.

---

## ✅ O que vem incluso

- Python 3.12 (imagem oficial `python:3.12`, **completa**)
- Locale `pt_BR.UTF-8` ativado e persistente
- Variáveis de ambiente configuradas:
  - `LANG=pt_BR.UTF-8`
  - `LC_ALL=pt_BR.UTF-8`
- `Poetry` instalado globalmente
- Dependências úteis para projetos Python:
  - `build-essential`, `gcc`, `libpq-dev`, `git`, `curl`, etc.

---

## 📦 Como usar no seu projeto (GitHub Actions)

```yaml
jobs:
  build:
    runs-on: ubuntu-latest
    container:
      image: ghcr.io/elinaldosoft/python-3.12-locale-pt-br:latest

    steps:
      - uses: actions/checkout@v4

      - name: Instalar dependências
        run: poetry install

      - name: Rodar testes
        run: poetry run pytest


