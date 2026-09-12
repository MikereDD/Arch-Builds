# GitHub setup

The repository contents are ready for GitHub and remain compatible with Forgejo. Apply these settings after the first push.

## Repository profile

- Description: `Secure, curated Arch Linux PKGBUILDs and package tooling.`
- Website: leave blank until documentation is published.
- Topics: `arch-linux`, `archlinux`, `pkgbuild`, `aur`, `packaging`, `aarch64`, `supply-chain-security`
- Social preview: use `assets/branding/arch-builds-avatar.png`.
- Default branch: `main`

Keep Issues enabled. Keep the Wiki disabled so standards and decisions remain versioned with the repository. Enable Discussions only when a public community needs a space separate from actionable issues.

## Actions

The included workflow performs static checks only. It does not source a `PKGBUILD`, invoke repository scripts, build packages, or persist checkout credentials.

Under **Settings → Actions → General**:

- Allow actions from GitHub, and restrict other third-party actions unless individually reviewed.
- Set workflow permissions to **Read repository contents and packages permissions**.
- Do not allow GitHub Actions to create or approve pull requests.

The checkout action is pinned to a complete commit SHA. Review and intentionally update that pin when upgrading it.

## Protect `main`

Create a branch ruleset targeting the default branch:

- Require a pull request before merging.
- Require at least one approval when another maintainer is available.
- Dismiss stale approvals when new commits are pushed.
- Require review from Code Owners when the plan supports it.
- Require all conversations to be resolved.
- Require the `Static policy` status check after it has run once.
- Require a linear history.
- Block force-pushes and branch deletion.
- Apply the rule to administrators when practical.

Repository-owned accounts may have fewer protection features on some GitHub plans. Organization ownership provides the strongest team and bypass controls.

## Security

Enable the security features available for the repository and plan:

- Private vulnerability reporting
- Secret scanning
- Push protection for supported secrets
- Dependency graph

Review alerts manually; do not grant an automated remediation bot permission to merge packaging changes without the normal package review.

## Merge policy

Prefer squash merges for focused package changes or rebase merges for intentionally structured series. Delete head branches after merge. Do not allow merge commits if the repository is enforcing a linear history.

## Releases

Use signed Git tags for standard and package milestones. GitHub release archives are snapshots of this source repository; they are not pacman packages. Build and sign pacman packages through the separate release process documented by the packaging standard.
