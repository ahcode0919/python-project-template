# Python Project Template

[![Template Checks](https://github.com/ahcodedev/python-project-template/actions/workflows/template.yml/badge.svg?branch=main)](https://github.com/ahcodedev/python-project-template/actions/workflows/template.yml)
[![Security](https://github.com/ahcodedev/python-project-template/actions/workflows/security.yml/badge.svg?branch=main)](https://github.com/ahcodedev/python-project-template/actions/workflows/security.yml)

A [Copier](https://copier.readthedocs.io/) template for Python projects. Projects created from it can pull in later
template changes with `copier update`.

## What's included

* `uv` for dependencies and `just` as the command runner
* ruff, ty, codespell, actionlint, and markdownlint for linting
* pytest with coverage, Zensical docs with an API reference generated from docstrings
* pip-audit, gitleaks, and zizmor for security checks
* prek git hooks, GitHub Actions CI, Dependabot, Release Drafter, and a release workflow
* A VS Code dev container

See [template/README.md.jinja](template/README.md.jinja) for the commands and workflows a generated project gets.

## Create a project

Requires [uv](https://docs.astral.sh/uv/). Copier asks for the project name, package name, description, and GitHub
`owner/repo`.

```bash
uvx copier copy --trust gh:ahcodedev/python-project-template my-project
```

`--trust` lets Copier run the template's post-create task (`uv lock`). New projects use the latest template release.

## Update a project

From the project folder, with a clean git working tree:

```bash
uvx copier update --trust
```

Copier compares the template release the project was created from (`_commit` in `.copier-answers.yml`) with the
latest release and applies only the template's changes, keeping your edits. Conflicts are marked for you to resolve,
like a git merge. Don't edit `.copier-answers.yml` by hand after it's created.

## Adopt Copier in an existing project

Projects created before the template used Copier have no `.copier-answers.yml`. To connect one:

1. Add `.copier-answers.yml` to the project root with the project's real values. `_commit` must be `v1.0.0` (or a
   later release), the first release with Copier support:

   ```yaml
   # Changes here will be overwritten by Copier; NEVER EDIT MANUALLY
   _commit: v1.0.0
   _src_path: gh:ahcodedev/python-project-template
   description: My project
   github_repo: someone/my-project
   package_name: my_project
   project_name: my-project
   ```

   `package_name` must match the project's `src/<package>/` folder.

2. Optional catch-up: Copier now assumes the project matches `v1.0.0`. To pick up template changes the project
   missed before that, run `uvx copier recopy --trust --vcs-ref v1.0.0` on a clean working tree, review `git diff`,
   and keep what you want.
3. Commit. From then on, `uvx copier update --trust` works as usual.

## Maintaining the template

* `copier.yml` - template questions and settings
* `template/` - the files copied into new projects. Only files ending in `.jinja` are rendered (the suffix is
  removed), so GitHub Actions `${{ }}` expressions in other files are left alone. Folder names can use placeholders
  too (`template/src/{{ package_name }}/`)
* `.github/` - CI, security, and release workflows for this template repository
* `prek.toml` - git hooks for this repository (`prek install` to enable)

Commands (requires `uv` and `just`; install `just` with `brew install just`, then run `just setup`):

* `just setup` - install Homebrew tools from the `Brewfile`
* `just render` - render a demo project into `_rendered/demo-project` from the current template, including
  uncommitted changes
* `just check` - render the demo project and run its lint, tests, docs build, pip-audit, and zizmor (used in CI)
* `just actionlint` - lint the root and template GitHub workflows
* `just zizmor` - audit the root and template GitHub workflows for security issues
* `just git-leaks` - scan staged changes for secrets with gitleaks
* `just prek` - run the git hooks on staged files

### Releases

Template releases use the same label-based Release Drafter flow as generated projects (see the Releases section of
[template/README.md.jinja](template/README.md.jinja)). The Release workflow publishes the draft and tags it `vX.Y.Z`.
Copier uses these tags as template versions, so changes merged to `main` reach projects only after a release.
