# deno-bin

Arch-Builds package for the official Deno 2.9.6 binary release on `x86_64` and `aarch64` Linux.

## Why this package exists

Arch Linux already ships the source-built [`deno`](https://archlinux.org/packages/extra/x86_64/deno/) package for `x86_64`; use that official package when it meets your needs. This package preserves Deno's upstream release binary and also supports `aarch64`, making it useful for Arch Linux ARM systems and for environments that intentionally standardize on upstream binaries.

This package provides and conflicts with `deno`, so it cannot be installed beside another Deno provider.

## Trust and update policy

- Downloads are pinned to an exact upstream release tag.
- The architecture-specific archive hashes match Deno's published checksum files.
- The versioned upstream MIT license is separately pinned by SHA-256.
- `check()` runs only the downloaded binary with `--version` and disables the update check.
- The package does not invoke Deno's installer or modify shell profiles.
- Release updates require fresh checksum verification and a regenerated `.SRCINFO`.

## Review and build

Review `PKGBUILD`, `.SRCINFO`, and every source URL before building. Then, on Arch Linux as an unprivileged user:

```bash
./scripts/validate.sh
makepkg --syncdeps --cleanbuild --clean --check
```

For final verification, use a clean chroot:

```bash
pkgctl build
namcap PKGBUILD
namcap deno-bin-*.pkg.tar.zst
```

After installation:

```bash
deno --version
pacman -Qo /usr/bin/deno
```

Do not run `deno upgrade` for this system package. Update it through pacman when a reviewed package revision is published.
