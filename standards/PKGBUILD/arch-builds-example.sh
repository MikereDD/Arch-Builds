#!/usr/bin/env bash
set -euo pipefail

version='1.0.0'

case "${1:-}" in
  --version|-V)
    printf 'arch-builds-example %s\n' "$version"
    ;;
  --help|-h)
    printf 'Usage: arch-builds-example [--help|--version]\n'
    ;;
  '')
    printf 'Arch-Builds packaging standard example\n'
    ;;
  *)
    printf 'arch-builds-example: unknown option: %s\n' "$1" >&2
    exit 2
    ;;
esac
