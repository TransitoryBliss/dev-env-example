# AGENTS.md

Notes for coding agents working on this repo.

## What this repo is

A public, filled-in example of the private config that consumes
[TransitoryBliss/dev-env](https://github.com/TransitoryBliss/dev-env). It is the template
(`dev-env/templates/default`) with the blanks filled in for a made-up user, `ada`, who has a
personal GitHub account (`ada-example`) and a work one (`ada-acme`, for repos under
`github.com/acme-corp`). The blog post at <https://stenbom.me/blog/my-dev-environment/> walks
through it.

## Rules

- **No real data.** Everything personal here is a placeholder: the SSH public key, account
  names, emails, `acme-corp`. Don't replace them with anyone's real values.
- **Don't edit the synced files here.** Everything except the files kept by hand is
  generated from `dev-env/templates/default` by `dev-env/templates/sync-example.sh`, which
  swaps `users/me.nix` for `users/ada.nix` and sets `NIXUSER ?= ada` in the `Makefile`.
  To change one of them, change the template in dev-env, then run from a dev-env checkout:

  ```sh
  templates/sync-example.sh ../dev-env-example          # write the example
  templates/sync-example.sh ../dev-env-example --check  # only report drift
  ```

  Files kept by hand, which the script never touches: `README.md`, `AGENTS.md`,
  `flake.lock` and `users/ada.nix`.
- `dev-env.mk` is the dev-env base's copy, unchanged. `make base/check` compares it with the
  locked `dev-env` input; after `nix flake update dev-env`, run the script again.
- **Generic improvements go to dev-env**, not here.
- `nvim/lazy-lock.json` is deliberately absent; Neovim writes it on first start.
- Commit as `Robert Stenbom <7187639+TransitoryBliss@users.noreply.github.com>`.

## Verifying changes

```sh
nix flake check    # evaluates both hosts (vm, wsl)
```
