# Contributing

This repository defines the default review standard for Arch-Builds packages. Changes should make the example clearer, safer, or more faithful to current Arch packaging conventions.

Before proposing a change:

1. Read every executable file in the repository.
2. Run `./scripts/validate.sh` as a normal user.
3. Regenerate `.SRCINFO` after any metadata change.
4. Build and test in a clean chroot when available.
5. Run `namcap` on both `PKGBUILD` and the built package.
6. Explain security-relevant exceptions in the commit and documentation.

Do not commit packages, source archives, logs, credentials, signing keys, cookies, or build directories.
