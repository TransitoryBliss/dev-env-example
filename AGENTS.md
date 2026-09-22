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
- **Keep in sync with the template.** When `dev-env/templates/default` changes (new option,
  renamed file, Makefile target), apply the same change here. The only intended differences
  are the filled-in `users/ada.nix`, `NIXUSER ?= ada` in the `Makefile`, the renamed user
  file in `flake.nix`, and the intro in `README.md`.
- **Generic improvements go to dev-env**, not here.
- `nvim/lazy-lock.json` is deliberately absent; Neovim writes it on first start.
- Commit as `Robert Stenbom <7187639+TransitoryBliss@users.noreply.github.com>`.

## Verifying changes

```sh
nix flake check    # evaluates both hosts (vm, wsl)
```
