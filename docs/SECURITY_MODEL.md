# Security model

## Protected assets

- Package consumers and their systems
- Maintainer accounts and repository permissions
- Source integrity and review history
- Package-signing keys and publication credentials
- Build workers and internal infrastructure

## Primary threats

- Malicious or compromised upstream releases
- Movable tags or substituted download assets
- Unreviewed shell code in contributed `PKGBUILD` files
- Dependency confusion or undeclared network downloads
- Credential exposure through logs, repository files, or CI
- A compromised builder gaining signing or repository-write authority

## Controls

- Canonical encrypted sources, immutable references, strong checksums, and upstream signatures
- Human review of all executable packaging content
- No root operations or network downloads inside build functions
- Disposable, unprivileged build isolation without secrets or host mounts
- Separate build, signing, and publication identities
- Protected default branch, review gates, signed releases, and recoverable backups

## CI position

No workflow should execute package code on a long-lived Forgejo runner. Static CI still executes repository-controlled workflow code and therefore requires an isolated runner. Add automation only after the runner threat model and credential boundary are documented and tested.
