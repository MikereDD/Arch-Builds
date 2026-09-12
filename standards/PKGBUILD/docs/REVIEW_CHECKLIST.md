# Package review checklist

## Identity and metadata

- [ ] Package name follows Arch naming conventions.
- [ ] Description is concise and does not repeat the package name unnecessarily.
- [ ] URL and license are accurate.
- [ ] Architecture list matches what was actually tested.
- [ ] Runtime, build, check, and optional dependencies are explicit.
- [ ] `pkgver` and `pkgrel` follow Arch semantics.

## Supply chain

- [ ] Sources are canonical HTTPS locations and immutable where practical.
- [ ] Every ordinary source has a strong checksum.
- [ ] Upstream signatures and full signing-key fingerprints are used when available.
- [ ] VCS sources are pinned to immutable or authenticated objects.
- [ ] Checksum changes agree with a documented upstream release.

## Behavior

- [ ] No privilege escalation, package-manager calls, service control, or host writes occur.
- [ ] Build functions do not download code or dependencies.
- [ ] Paths are quoted and use `$srcdir` and `$pkgdir` correctly.
- [ ] Tests are present or their absence is justified.
- [ ] Installed ownership and permissions are appropriate.
- [ ] Configuration and state use standard filesystem locations.

## Release gate

- [ ] `.SRCINFO` was regenerated and matches `PKGBUILD`.
- [ ] Syntax, ShellCheck, and policy validation passed.
- [ ] `namcap` findings were resolved or documented.
- [ ] Clean build passed on every supported architecture.
- [ ] Install, upgrade, removal, and primary behavior were tested.
- [ ] Final diff was reviewed by another maintainer when available.
- [ ] The package and repository database will be signed separately from the build step.
