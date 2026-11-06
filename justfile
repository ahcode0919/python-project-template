audit:
    uv run pip-audit --skip-editable
ci-lint:
    uv run ty check
    uv run ruff check .
    uv run ruff format --check .
    uv run codespell
    uv run actionlint
docs-build:
    uv run zensical build --strict
# docs-serve:
#     uv run zensical serve
git-leaks:
    gitleaks git --pre-commit --staged --redact
lint:
    uv run ty check
    uv run ruff check . --fix
    uv run ruff format .
    uv run codespell
    uv run actionlint
markdownlint:
    markdownlint-cli2 "**/*.md"
prek:
    uv run prek
set-github-labels:
    ./scripts/sync-labels.sh
setup:
    brew bundle install
    just sync
sync:
    uv sync --all-groups
test:
    uv run pytest
zizmor:
    zizmor . --collect all
