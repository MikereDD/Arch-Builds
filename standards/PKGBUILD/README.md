# Arch-Builds PKGBUILD Standard

This directory is the canonical, versioned standard for every package maintained by the **Arch-Builds** Forgejo organization. New package directories start here, and changes to the standard are reviewed here first.

Current standard: **1.0.0**

It is deliberately a harmless, working demonstration package—not a distribution channel for Deno or any other real application. Keeping the example buildable lets us continuously test the same baseline that real packages are expected to follow.

The example builds and installs:

```text
/usr/bin/arch-builds-example
/usr/share/man/man1/arch-builds-example.1.gz
/usr/share/licenses/arch-builds-example/LICENSE
```

The installed command prints a short message and supports `--version`. Its purpose is to demonstrate the complete package lifecycle while remaining easy to audit.

## What this demonstrates

- Conventional `PKGBUILD` metadata and function ordering
- A self-contained, AUR-compatible repository layout
- Strong checksums for every local source
- A non-interactive `check()` function
- Correct use of `$srcdir` and `$pkgdir`
- License and manual-page installation
- Generated and committed `.SRCINFO`
- No network access during `prepare()`, `build()`, `check()`, or `package()`
- No root commands or host mutation inside the package recipe
- Syntax, metadata, policy, and `namcap` validation
- Clean-chroot builds through `pkgctl build`

## Repository layout

```text
PKGBUILD-Standard/
├── PKGBUILD
├── .SRCINFO
├── arch-builds-example.sh
├── arch-builds-example.1
├── LICENSE
├── README.md
├── CONTRIBUTING.md
├── SECURITY.md
├── docs/
│   ├── PACKAGE_STANDARD.md
│   └── REVIEW_CHECKLIST.md
└── scripts/
    └── validate.sh
```

## Build the example

Review `PKGBUILD` and every file in `source=()` before running it. A `PKGBUILD` is executable Bash code.

```bash
sudo pacman -S --needed base base-devel devtools namcap shellcheck
./scripts/validate.sh
makepkg --syncdeps --cleanbuild --clean --check
```

On official Arch Linux, the preferred final verification is a clean chroot:

```bash
pkgctl build
```

Inspect the resulting package:

```bash
namcap PKGBUILD
namcap arch-builds-example-*.pkg.tar.zst
```

Install only after review:

```bash
sudo pacman -U arch-builds-example-*.pkg.tar.zst
arch-builds-example --version
pacman -Qo /usr/bin/arch-builds-example
```

## Starting every new package

Create each real package directory from a reviewed release of this standard. Follow [docs/ADOPTING_THE_STANDARD.md](docs/ADOPTING_THE_STANDARD.md), replace all example names and metadata, replace local sources with canonical upstream HTTPS sources, pin integrity values, add upstream signatures when available, and regenerate `.SRCINFO`:

```bash
makepkg --printsrcinfo > .SRCINFO
```

Never copy the example checksums into another package. Review the complete checklist in [docs/REVIEW_CHECKLIST.md](docs/REVIEW_CHECKLIST.md) before merging or releasing.

The words **MUST**, **MUST NOT**, **SHOULD**, and **MAY** in this repository distinguish mandatory policy from recommendations. Package-specific exceptions must be narrow, documented, and approved during review.
