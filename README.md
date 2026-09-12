<p align="center">
  <img src="assets/branding/arch-builds-avatar.png" width="180" alt="Arch-Builds logo">
</p>

# Arch-Builds

Secure, curated Arch Linux `PKGBUILD` recipes and package tooling for Arch Linux and Arch Linux ARM.

This is the main repository for the Arch-Builds organization. It contains the packaging standard every recipe follows, the maintained package directories, repository documentation, and safe local validation helpers. The same tree is designed to work on both Forgejo and GitHub.

## Repository map

```text
Arch-Builds/
├── assets/branding/       # organization and repository artwork
├── standards/PKGBUILD/    # canonical, working PKGBUILD standard
├── packages/<pkgbase>/    # one self-contained package directory each
├── docs/                  # repository workflow and security model
├── scripts/               # repository-wide maintenance helpers
├── .github/               # review and issue templates
├── CONTRIBUTING.md
├── SECURITY.md
└── README.md
```

## Packaging standard

[`standards/PKGBUILD/`](standards/PKGBUILD/) is the source of truth for every package created here. Standard version **1.0.0** includes a harmless package that actually builds, checks, installs a command and manual page, and demonstrates correct package ownership.

Every maintained package must:

- remain independently AUR-compatible inside its package directory;
- record the standard version it was reviewed against;
- use canonical HTTPS sources and strong integrity verification;
- avoid root operations, host mutation, and network access during build functions;
- commit a current `.SRCINFO` beside `PKGBUILD`;
- pass review, validation, clean-build, `namcap`, and runtime checks;
- keep packages, source archives, logs, credentials, cookies, and signing keys out of Git.

Read the full [package standard](standards/PKGBUILD/docs/PACKAGE_STANDARD.md) and [review checklist](standards/PKGBUILD/docs/REVIEW_CHECKLIST.md).

## Creating a package

Start from the standard—not from an unrelated AUR recipe:

1. Copy `standards/PKGBUILD/` to `packages/<pkgbase>/`.
2. Follow [Adopting the standard](standards/PKGBUILD/docs/ADOPTING_THE_STANDARD.md).
3. Replace all example metadata, files, tests, and checksums.
4. Generate `.SRCINFO` with `makepkg --printsrcinfo > .SRCINFO`.
5. Run the package validator, build in clean isolation, and complete the review checklist.

Repository-wide static validation:

```bash
./scripts/check-all.sh
```

See [Package workflow](docs/PACKAGE_WORKFLOW.md) for the complete lifecycle.

## Trust boundary

A `PKGBUILD` is executable Bash. Pull requests and contributed recipes are untrusted until reviewed. This repository intentionally contains no automatic build workflow: package code must not execute on a persistent Forgejo runner until a disposable, unprivileged runner with no secrets or host mounts exists.

See [Security model](docs/SECURITY_MODEL.md) and [SECURITY.md](SECURITY.md).

## Forgejo and GitHub

Forgejo may remain the private authoritative remote while GitHub serves as a public mirror, or the two roles may be reversed. Never push secrets, private package sources, or signing material to either service. Configure the GitHub repository using the reviewed [GitHub setup checklist](docs/GITHUB_SETUP.md).

The included GitHub Actions workflow performs read-only static checks. It deliberately does not execute package recipes or build packages from pull requests.

## License

Repository-maintained scripts and documentation are MIT licensed unless a file says otherwise. Each packaged application retains its own upstream license and must install required license text correctly.
