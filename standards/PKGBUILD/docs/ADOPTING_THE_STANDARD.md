# Adopting the standard

Every Arch-Builds package directory starts from the standard included in a tagged release of the main `Arch-Builds` repository. Do not copy a random working-tree snapshot.

## Create a package repository

1. Start from `standards/PKGBUILD/` in the latest reviewed `Arch-Builds` tag.
2. Rename `arch-builds-example.sh` and `arch-builds-example.1`, or remove them when the real package does not need local equivalents.
3. Replace every `arch-builds-example` value in `PKGBUILD`, sources, documentation, and tests.
4. Set accurate `pkgname`, `pkgver`, `pkgrel`, `pkgdesc`, `arch`, `url`, `license`, and dependencies.
5. Prefer canonical upstream HTTPS release sources. Add signature files and full `validpgpkeys` fingerprints when upstream signs releases.
6. Generate fresh integrity values. Never reuse the demonstration checksums.
7. Implement only the standard functions the package needs: `prepare()`, `pkgver()`, `build()`, `check()`, and `package()`.
8. Regenerate `.SRCINFO` with `makepkg --printsrcinfo > .SRCINFO`.
9. Replace this README with package-specific build, test, maintenance, and architecture notes while retaining `SECURITY.md` and the review checklist.
10. Run `./scripts/validate.sh`, then complete a clean build and runtime test.

## Record conformance

Keep this header near the top of every maintained `PKGBUILD`:

```bash
# Arch-Builds-Standard: 1.0.0
```

It records the last standard version against which the package was reviewed. It does not affect `makepkg`.

## Updating existing packages

When this standard releases a new version:

1. Read the standard changelog and diff.
2. Apply relevant mandatory changes to each package repository.
3. Re-run the complete review checklist and clean build.
4. Update the `Arch-Builds-Standard` header only after verification.
5. Increment the package's `pkgrel` when the update changes the produced package.

## Exceptions

An exception must identify the exact rule, explain why the package cannot comply, describe the security or maintenance impact, and name the compensating control. Keep it in the package README where reviewers and future maintainers will see it.
