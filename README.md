# hardened-release

Hardened Conventional Commit release automation for Dagger and CI.

`hardened-release` is a security-conscious release tool for projects that use Conventional Commits and SemVer. It generates release plans, changelogs, version bumps, release commits, and Git tags while keeping the runtime trust boundary intentionally small.

The goal is not to be the most feature-rich release tool. The goal is to make release automation easier to audit, safer to run in CI, and harder to abuse when release credentials are involved.

## Purpose

Most release tools do several things at once:

- parse Git history
- calculate the next SemVer version
- generate a changelog
- update version files
- create release commits
- create Git tags
- push to a remote
- sometimes publish packages or create hosted releases

That convenience often comes with a large dependency graph, shell execution, broad environment access, and tokens available during complex release logic.

`hardened-release` takes a narrower approach.

It is designed to:

- read local Git history
- parse Conventional Commit messages
- calculate the next SemVer bump
- generate a changelog
- optionally update release files
- optionally create a local release commit and tag
- keep pushing/publishing as a separate explicit step

## Design goals

- Minimal dependency surface
- No npm release CLI dependency
- No shell execution for core release logic
- No network access during planning or changelog generation
- No environment access during planning or changelog generation
- No release token present during changelog/version calculation
- Git is the only required subprocess
- Release mutations are explicit, not default
- Output should be reviewable before pushing

## Security posture

`hardened-release` is designed around the principle of least privilege.

The default planning/changelog path should require only:

```text
read access to the repository
run access to git
optional write access to selected release files