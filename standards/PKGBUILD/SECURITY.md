# Security policy

A `PKGBUILD` is executable shell code, not passive metadata. Review package recipes, patches, install scripts, and all local sources before running `makepkg`.

## Repository rules

- Never build as root.
- Never store credentials, cookies, tokens, private keys, or passphrases here.
- Never weaken a checksum or signature check merely to make a release build.
- Treat an unexplained checksum change without a version change as a possible supply-chain incident.
- Build untrusted contributions only in disposable isolation without secrets, privileged sockets, or writable host mounts.
- Do not run pull-request `PKGBUILD` code on a persistent Forgejo runner.
- Separate building from signing and publishing.
- Protect the default branch and prevent force-pushes and deletion.

Report suspected compromise privately to an Arch-Builds owner rather than placing sensitive details in a public issue.
