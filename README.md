# Python Project Template ![](https://github.com/ahcode0919/python-project-template/actions/workflows/ci.yml/badge.svg?branch=main)


Baseline Python project template

## Setup

Project supports local development and VSCode Dev container development

### Local development

- Recommended
  - Install [`pyenv`](https://github.com/pyenv/pyenv)
    - Install current Python version: `pyenv install 3.14.2`
    - Set global Python version: `pyenv global 3.14.2`
  - Or Install with Homebrew
    - Install python 3 `brew install python3`
- Initialize virtual environment: `python3 -m venv .venv`
- Activate: `source .venv/bin/activate`
- Install packages: `pip install -r requirements.txt`

### VS Code Dev Container

- Install Docker
- Install VSCode
- Open project folder in VS Code
- Install recommended extensions
- Reopen in container using Remote Development Container menu

## Project Commands

- Local
  - `just lint` - lint project files
- Dev container
  - `just lint` - lint and stylecheck project files
- Run unit tests: `just test`

## Usage

- Usage Notes

## Update Dependencies

- Install dependency: `pip install {dependency}`
- Update requirements file: `pip freeze > requirements.txt`
