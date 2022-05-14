# Python Project Template

Baseline Python project template

## Setup

Project supports local development and VSCode Dev container development

### Local development

- Recommended
  - Install [`pyenv`](https://github.com/pyenv/pyenv)
  - Install current Python version: `pyenv install 3.10.3`
  - Set global Python version: `pyenv global 3.10.3`
- Initialize virtual environment: `python -m venv .venv`
- Activate: `source .venv/bin/activate`
- Install packages: `pip -r requirements.txt`

### VS Code Dev Container

- Install Docker
- Install VSCode
- Open project folder in VS Code
- Install recommended extensions
- Reopen in container using Remote Development Container menu

## Project Commands

- Local
  - `pylint *` - lint project files
  - `pycodestyle *` - style check project files
- Dev container
  - `lint` - lint and stylecheck project files
- Run unit tests: `pytest`

## Usage

- Usage Notes

## Update Dependencies

- Install dependency: `pip install {dependency}`
- Update requirements file: `pip freeze > requirements.txt`
