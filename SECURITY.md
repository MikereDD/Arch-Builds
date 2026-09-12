# Security policy

`PKGBUILD` files and their supporting scripts are executable code. Review them before invoking `makepkg` or any repository helper.

## Reporting

Report source substitution, unexplained checksum changes, malicious build behavior, exposed credentials, or signing-key concerns privately to an Arch-Builds owner. Do not put secrets or exploit details in an issue.

## Maintainer requirements

- Never build as root.
- Never commit credentials, cookies, tokens, private keys, or passphrases.
- Never weaken integrity or signature verification to make a release build.
- Treat checksum changes without a matching upstream release as a potential incident.
- Build untrusted contributions only in disposable, isolated environments with no secrets, privileged sockets, or writable host mounts.
- Keep build and signing identities separate.
- Protect `main`, prevent force-pushes and deletion, and require review where practical.
- Sign published packages and repository databases before configuring clients to trust them.

If compromise is suspected, stop publication, rotate affected credentials, remove suspect artifacts, identify the last trusted revision, and rebuild from independently verified sources.
