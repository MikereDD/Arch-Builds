# Repository structure

## `standards/PKGBUILD/`

The versioned source of truth for package layout, mandatory policy, validation, and review. It contains a harmless working package so the baseline can be tested rather than merely described.

## `packages/<pkgbase>/`

Each child directory is a complete package recipe. It must be independently understandable and AUR-compatible: copying the directory into its own Git repository must not require shared files from this repository.

Required package files are `PKGBUILD`, `.SRCINFO`, package-specific `README.md`, required license texts, and any patches or service files named in `source=()`.

## `scripts/`

Repository-wide maintenance helpers. These scripts may discover and statically validate packages, but package-specific behavior stays inside the package directory.

## `assets/`

Repository identity and documentation artwork. Package build functions must not depend on these assets.

## `docs/` and `.github/`

Human-facing workflow, review, security, and contribution metadata. These files never replace the package's own build instructions.
