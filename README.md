# Python Project Template

[![CI](https://github.com/ahcodedev/python-project-template/actions/workflows/python.yml/badge.svg?branch=main)](https://github.com/ahcodedev/python-project-template/actions/workflows/python.yml)
[![gitleaks](https://img.shields.io/badge/protected%20by-gitleaks-blue)](https://github.com/gitleaks/gitleaks)

Baseline Python project template

## Setup

Project supports local development and VSCode Dev container development

### Local Development Installation

Note: Project uses `uv` and `just` to manage project configuration and commands

* Install dependencies via Homebrew - `brew bundle install`
* Sync project - `just sync`

### VS Code Dev Container

* Install Docker
* Install VSCode
* Open project folder in VS Code
* Install recommended extensions
* Reopen in container using Remote Development Container menu

## Project Commands

* `just sync` - sync project dependencies (all groups)
* `just lint` - type check, lint, format, and spellcheck project files (applies fixes)
* `just ci-lint` - run the same checks without modifying files (used in CI)
* `just test` - run unit tests
* `just prek` - run pre-commit hooks via prek
* `just git-leaks` - scan staged changes for secrets with gitleaks
* `uv add {package}` - install a dependency

## Usage

* Usage Notes
