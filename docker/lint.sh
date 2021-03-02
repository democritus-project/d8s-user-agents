#!/usr/bin/env bash

set -euxo pipefail

echo "Running linters and formatters..."

isort democritus_user_agents/ tests/

black democritus_user_agents/ tests/

mypy democritus_user_agents/ tests/

pylint --fail-under 9 democritus_user_agents/*.py

flake8 democritus_user_agents/ tests/

bandit -r democritus_user_agents/

# we run black again at the end to undo any odd changes made by any of the linters above
black democritus_user_agents/ tests/
