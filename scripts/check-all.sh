#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)

if (( EUID == 0 )); then
  printf 'error: run package checks as a normal user\n' >&2
  exit 1
fi

printf 'Validating PKGBUILD standard\n'
"$repo_root/standards/PKGBUILD/scripts/validate.sh"

package_count=0
while IFS= read -r -d '' pkgbuild; do
  package_dir=$(dirname -- "$pkgbuild")
  package_name=${package_dir##*/}
  printf 'Validating package: %s\n' "$package_name"

  if [[ -x "$package_dir/scripts/validate.sh" ]]; then
    "$package_dir/scripts/validate.sh"
  else
    bash -n "$pkgbuild"
    [[ -f "$package_dir/.SRCINFO" ]] || {
      printf 'error: %s is missing .SRCINFO\n' "$package_name" >&2
      exit 1
    }
  fi

  ((package_count += 1))
done < <(find "$repo_root/packages" -mindepth 2 -maxdepth 2 -type f -name PKGBUILD -print0 | sort -z)

printf 'Repository checks passed (%d maintained package directories)\n' "$package_count"
