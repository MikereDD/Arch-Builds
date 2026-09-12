# Packages

Each maintained package lives in `packages/<pkgbase>/` and is copied from the current `standards/PKGBUILD/` baseline.

Before creating one, build and inspect the harmless [`arch-builds-example`](../standards/PKGBUILD/) reference package, then follow [Adopting the standard](../standards/PKGBUILD/docs/ADOPTING_THE_STANDARD.md).

Do not place loose `PKGBUILD` files directly in this directory. A package directory must be self-contained, AUR-compatible, documented, and independently reviewable.

The demonstration recipe remains under `standards/PKGBUILD/` and must never be published as production software.
