#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)
cd -- "$repo_root"

if (( EUID == 0 )); then
  printf 'error: run validation and makepkg as a normal user\n' >&2
  exit 1
fi

for required in PKGBUILD .SRCINFO README.md LICENSE; do
  [[ -f $required ]] || { printf 'error: missing %s\n' "$required" >&2; exit 1; }
done

bash -n PKGBUILD
bash -n arch-builds-example.sh

if grep -En '(^|[;&|[:space:]])(sudo|doas|su|pacman|systemctl)([;&|[:space:]]|$)' PKGBUILD; then
  printf 'error: privileged or host-mutating command found in PKGBUILD\n' >&2
  exit 1
fi

if grep -En "[\"']http://" PKGBUILD; then
  printf 'error: insecure HTTP source found in PKGBUILD\n' >&2
  exit 1
fi

if grep -En '(b2|sha(256|384|512))sums=.*SKIP' PKGBUILD; then
  printf 'error: SKIP is not allowed for ordinary sources\n' >&2
  exit 1
fi

if command -v shellcheck >/dev/null 2>&1; then
  shellcheck arch-builds-example.sh scripts/validate.sh
else
  printf 'warning: shellcheck is not installed\n' >&2
fi

if command -v makepkg >/dev/null 2>&1; then
  generated=$(mktemp)
  trap 'rm -f -- "$generated"' EXIT
  makepkg --verifysource
  makepkg --printsrcinfo > "$generated"
  diff -u .SRCINFO "$generated"
else
  printf 'warning: makepkg is unavailable; source and .SRCINFO checks were skipped\n' >&2
fi

if command -v namcap >/dev/null 2>&1; then
  namcap PKGBUILD
else
  printf 'warning: namcap is not installed\n' >&2
fi

printf 'Arch-Builds example validation passed\n'
