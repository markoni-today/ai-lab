#!/usr/bin/env bash
# Все коммиты лаборатории идут в одну ветку.
# Установка как git-хук: ln -sf ../../scripts/check-branch.sh .git/hooks/pre-commit
set -euo pipefail

expected="ai-lab"
current="$(git branch --show-current)"

if [[ "$current" != "$expected" ]]; then
  echo "Ошибка: текущая ветка '$current', а работать можно только в '$expected'." >&2
  echo "Выполни: git checkout $expected" >&2
  exit 1
fi
