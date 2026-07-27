lint:
    uv run ruff check . --fix
    uv run ruff format .
sync:
    uv sync --all-groups
test:
    uv run pytest