# Python Project Template

[![CI](https://github.com/ahcode0919/python-project-template/actions/workflows/python.yml/badge.svg?branch=main)](https://github.com/ahcode0919/python-project-template/actions/workflows/python.yml)
[![Security](https://github.com/ahcode0919/python-project-template/actions/workflows/security.yml/badge.svg?branch=main)](https://github.com/ahcode0919/python-project-template/actions/workflows/security.yml)
[![gitleaks](https://img.shields.io/badge/protected%20by-gitleaks-blue)](https://github.com/gitleaks/gitleaks)

Baseline Python project template

## Setup

Project supports local development and VSCode Dev container development

### Local Development Installation

Note: Project uses `uv` (0.13.x, enforced by `required-version` in `pyproject.toml`) and `just` to
manage project configuration and commands

* Install tools and sync the project - `just setup` (runs `brew bundle install`, then `just sync`)

### VS Code Dev Container

* Install Docker
* Install VSCode
* Open project folder in VS Code
* Install recommended extensions
* Reopen in container using Remote Development Container menu

The base image, `just`, and `uv` are pinned by version and digest in `.devcontainer/Dockerfile`
and updated by Dependabot. To change the Python version, edit the `FROM` line.

## Project Commands

* `just setup` - install Homebrew tools from the `Brewfile` and sync the project
* `just sync` - sync project dependencies (all groups)
* `just lint` - type check, lint, format, and spellcheck project files (applies fixes)
* `just ci-lint` - run the same checks without modifying files (used in CI)
* `just test` - run unit tests
* `just prek` - run pre-commit hooks via prek
* `just git-leaks` - scan staged changes for secrets with gitleaks
* `just zizmor` - audit GitHub Actions workflows for security issues
* `just set-github-labels` - create or update the release labels on GitHub (requires `gh auth login`)
* `uv add {package}` - install a dependency

## CI and Security

| Workflow                                          | Runs on                      | Purpose                                        |
| ------------------------------------------------- | ---------------------------- | ---------------------------------------------- |
| `python.yml`                                      | push / PR to `main`          | lint and unit tests                            |
| `security.yml`                                    | push to `main`, all PRs      | zizmor workflow audit, gitleaks secret scan    |
| `release-drafter.yml`                             | push to `main`, PRs          | update the draft release, label PRs            |
| `release.yml`                                     | manual                       | publish a release                              |

* GitHub Actions are pinned to full commit SHAs, with the version in a trailing comment
* Dependabot (`.github/dependabot.yml`) checks weekly for updates to GitHub Actions, Python
  dependencies, the dev container image, and dev container features. New releases wait 7 days
  before an update is proposed. Dependabot PRs get the `dependencies` label

## Releases

Releases are managed with [Release Drafter](https://github.com/release-drafter/release-drafter),
which reads the **release labels** on merged pull requests.

A release label is a GitHub label added to the pull request itself, from the **Labels** section
of the PR sidebar. Release Drafter only reads these labels. Commit messages and PR titles are not
parsed, so prefixes like `feat:` or `fix:` have no effect. Only the labels below count as release
labels; other repository labels (e.g. `good first issue`, `question`) are ignored.

| Release label                                                     | Version bump | Release notes section |
| ----------------------------------------------------------------- | ------------ | --------------------- |
| `breaking`                                                        | major        | Breaking Changes      |
| `feature`, `enhancement`                                          | minor        | Features              |
| `bug`, `fix`                                                      | patch        | Bug Fixes             |
| `chore`, `ci`, `dependencies`, `documentation`, `refactor`        | patch        | Maintenance           |
| `skip-changelog`                                                  | none         | Excluded              |

* Every PR must have at least one release label, or the `Release Drafter / require-label` check fails. If a release
  has PRs with different labels, the largest bump wins
* Release labels are added automatically from the PR's branch name prefix (`feat/`, `fix/`, `chore/`,
  `ci/`, `docs/`, `refactor/`) and from the files it changes. You can add or change them by hand
* Run `just set-github-labels` once to create the release labels in the GitHub repository
* Merging to `main` updates a draft GitHub Release with the next version and notes
* To release, run the **Release** workflow from the Actions tab. It bumps the version in
  `pyproject.toml`/`uv.lock`, updates `CHANGELOG.md`, tags the release, and uploads build artifacts

## Usage

* Usage Notes
