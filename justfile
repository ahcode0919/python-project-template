ci-lint:
    uv run ty check
    uv run ruff check .
    uv run ruff format --check .
    uv run codespell
lint:
    uv run ty check
    uv run ruff check . --fix
    uv run ruff format .
    uv run codespell
sync:
    uv sync --all-groups
test:
    uv run pytest
