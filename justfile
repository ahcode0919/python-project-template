ci-lint:
    uv run ty check
    uv run ruff check .
    uv run ruff format --check .
    uv run codespell
git-leaks:
    gitleaks git --pre-commit --staged --redact
lint:
    uv run ty check
    uv run ruff check . --fix
    uv run ruff format .
    uv run codespell
prek:
    uv run prek
sync:
    uv sync --all-groups
test:
    uv run pytest
