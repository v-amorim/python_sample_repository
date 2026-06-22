## Setup

This project uses [uv](https://docs.astral.sh/uv/) to manage the Python version, the virtual environment and dependencies.

The required Python version is pinned in `.python-version` (3.12.2). uv installs it automatically when needed.

```powershell
# Install dependencies (creates .venv and resolves uv.lock)
> uv sync
# Install pre-commit hooks (code standards)
> uv run pre-commit install
```

______________________________________________________________________

## Make

Common tasks are wrapped in a `Makefile` so they're discoverable and consistent.
Run `make` (or `make help`) to list the available targets:

| Target         | What it does                                           |
| -------------- | ------------------------------------------------------ |
| `make install` | `uv sync` + install pre-commit hooks                   |
| `make run`     | Run the application entry point                        |
| `make test`    | Run the test suite                                     |
| `make lint`    | Lint with ruff                                         |
| `make format`  | Format with ruff                                       |
| `make check`   | Lint, check formatting, and run tests                  |
| `make hooks`   | Run all pre-commit hooks against every file            |
| `make lock`    | Re-resolve dependencies to the latest allowed versions |
| `make clean`   | Remove caches and build artifacts                      |

### Installing `make` on Windows

`make` is not bundled with Windows. Install it with one of:

```powershell
# winget (built in on Windows 11)
> winget install GnuWin32.Make
# or Chocolatey
> choco install make
# or Scoop
> scoop install make
```

Then run the targets from **PowerShell** or, if you installed via GnuWin32, from
**Git Bash**. If you'd rather not install `make`, every target maps directly to a
`uv run ...` command you can copy from the `Makefile`.

______________________________________________________________________

## Dependencies

Dependencies are declared in `pyproject.toml` under `[project].dependencies` and locked in `uv.lock`.

```powershell
# Add a runtime dependency (updates pyproject.toml and uv.lock)
> uv add <package>
# Add a development-only dependency (lint, test, tooling)
> uv add --dev <package>
# Remove a dependency
> uv remove <package>
# Re-resolve the lock to the latest allowed versions
> uv lock --upgrade
# Sync the environment with the lock
> uv sync
```

______________________________________________________________________

## Running Code

Run code through uv so it uses the project environment without manual activation:

```powershell
# Via the console script declared in pyproject.toml
> uv run python_sample_repository
# Or run the module directly
> uv run python -m python_sample_repository.main
```

______________________________________________________________________

## Tests

```powershell
> uv run pytest
```

______________________________________________________________________

## Pre-commit

To check if changed files follow the code standards using pre-commit, run:

```powershell
> uv run pre-commit run --all-files
```
