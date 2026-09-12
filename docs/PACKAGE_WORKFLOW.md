# Package workflow

## 1. Intake

Confirm the package is useful, legally distributable, maintainable, and not already provided adequately by an official repository. Identify canonical upstream sources, target architectures, dependencies, tests, and signature support.

## 2. Scaffold

Copy the current `standards/PKGBUILD/` directory to `packages/<pkgbase>/`. Follow its adoption guide and remove every demonstration-only value.

## 3. Implement

Use `prepare()` for patches, `build()` for compilation, `check()` for non-interactive tests, and `package()` only for installation beneath `$pkgdir`. Let `makepkg` acquire and extract sources.

## 4. Verify

Review every executable file, verify source identity and integrity, regenerate `.SRCINFO`, run local validation, perform a clean build, inspect with `namcap`, and test on the target architecture.

## 5. Review and merge

Complete the pull-request checklist. Explain all exceptions. Protect `main` from force-pushes and merge only reviewed changes.

## 6. Release

Tag the reviewed recipe, build in isolated infrastructure, and keep publishing credentials out of the build environment. Sign package artifacts and repository metadata in a separate protected step.

## 7. Maintain

Track upstream releases and security notices. Increment `pkgrel` for packaging-only changes and reset it to `1` for a new upstream version. Re-review packages when the PKGBUILD standard changes.
