# Contributing

All package work begins with the current files in `standards/PKGBUILD/` and follows the documented review checklist.

## Package changes

1. Limit a change to one package unless it updates the project-wide standard.
2. Read `PKGBUILD`, install scripts, patches, and every local source before running them.
3. Update package metadata and integrity values from canonical upstream information.
4. Regenerate `.SRCINFO`; never edit it manually.
5. Run `./scripts/check-all.sh` and the package-specific validator.
6. Complete a clean build and `namcap` review on every supported architecture.
7. Test installation, upgrade, removal, file ownership, permissions, and primary behavior.
8. Complete the review checklist in the pull request.

## Standard changes

Changes under `standards/PKGBUILD/` affect every future package. Update `STANDARD_VERSION` and the standard changelog when behavior or policy changes. Explain migration requirements for existing packages.

## Commit style

Use concise, scoped subjects:

```text
foo: update to 2.0.1
foo: correct runtime dependency
standard: require upstream signature verification
docs: clarify ARM64 clean-build process
```

Do not commit built packages, downloaded sources, build logs, credentials, cookies, private keys, or generated signing material.
