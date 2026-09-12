# Arch-Builds package standard

## Required files

Every package repository must contain:

- `PKGBUILD`
- `.SRCINFO`, generated from the current `PKGBUILD`
- `README.md` with purpose, architecture, build, test, and maintenance notes
- Required local sources, patches, service units, hooks, and custom-license texts

Repository-wide contribution and security policies are strongly recommended.

## Sources and integrity

- Use canonical upstream HTTPS sources.
- Prefer immutable release archives or pinned VCS object hashes.
- Use the strongest integrity value published by upstream; SHA-256 is the minimum default.
- Add detached upstream signatures and full `validpgpkeys` fingerprints when available.
- Do not use `SKIP` for ordinary release files.
- Do not silently substitute unofficial mirrors when canonical integrity verification fails.
- Give downloaded files unique names with `name::url` where collisions are possible.

## Recipe behavior

- Keep functions deterministic, non-interactive, and understandable.
- Let `makepkg` acquire and extract sources.
- Do not fetch from the network inside `prepare()`, `build()`, `check()`, or `package()`.
- Do not use `sudo`, `su`, `doas`, `pacman`, or `systemctl` in packaging functions.
- Write installed files only beneath `$pkgdir`.
- Put patches in `prepare()`, compilation in `build()`, tests in `check()`, and installation in `package()`.
- Declare direct runtime, build, check, and optional dependencies accurately.
- Avoid `.install` scripts when packaged files, tmpfiles, sysusers, or pacman hooks can perform the job.

## Metadata and maintenance

- Use a valid SPDX license identifier where Arch packaging supports it.
- Increment `pkgrel` for packaging-only changes and reset it to `1` for a new upstream release.
- Regenerate `.SRCINFO` with `makepkg --printsrcinfo > .SRCINFO`; never edit it manually.
- Document downstream patches with their upstream issue or rationale.
- Keep each repository independently buildable and AUR-compatible.

## Verification

- `bash -n PKGBUILD`
- `shellcheck` for maintained shell sources
- `makepkg --verifysource`
- `.SRCINFO` freshness comparison
- `namcap PKGBUILD`
- Clean-chroot build through `pkgctl build` where supported
- `namcap` on the package archive
- Installation, upgrade, removal, ownership, permissions, and functional tests on the target architecture
