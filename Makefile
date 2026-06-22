.DEFAULT_GOAL := check

.PHONY: install sync run test lint format check hooks lock clean

install: ## Create the venv, sync deps, and install pre-commit hooks
	uv sync
	uv run pre-commit install

sync: ## Sync the environment with uv.lock
	uv sync

run: ## Run the application entry point
	uv run python_sample_repository

test: ## Run the test suite
	uv run pytest

lint: ## Lint with ruff
	uv run ruff check .

format: ## Format with ruff
	uv run ruff format .

check: ## Lint, check formatting, and run tests
	uv run ruff check .
	uv run ruff format --check .
	uv run pytest

hooks: ## Run all pre-commit hooks against every file
	uv run pre-commit run --all-files

lock: ## Re-resolve dependencies to the latest allowed versions
	uv lock --upgrade
