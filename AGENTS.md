## Development environment

`flake.nix` is the single source of truth for this project's development tools. Always run development commands inside its default dev shell so the pinned toolchain is used.

- Start an interactive environment with `nix --extra-experimental-features "nix-command flakes" develop`, then run project commands normally.
- Run a single command with `nix --extra-experimental-features "nix-command flakes" develop --command <command>`, for example `nix --extra-experimental-features "nix-command flakes" develop --command deno task test`.
- With direnv installed, allow the checked-in `.envrc` once with `direnv allow`; it activates the same flake environment automatically when entering the repository.
- Add or update required development tools in `flake.nix` rather than relying on globally installed versions.

## Agent skills

### Issue tracker

Issues and specs are tracked as local Markdown files under `.scratch/`. See `docs/agents/issue-tracker.md`.

### Triage labels

The tracker uses the default canonical triage labels. See `docs/agents/triage-labels.md`.

### Domain docs

Domain documentation uses the single-context layout. See `docs/agents/domain.md`.
