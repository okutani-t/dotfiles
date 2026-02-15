# dotfiles

Dotfiles for macOS development environments (zsh, vim, git, emacs, etc.).

This repository is primarily maintained for personal use, but the setup steps are documented so others can inspect or reuse parts safely.

## Requirements

- macOS
- `git`
- Home directory write permission

## Quick Start

```bash
git clone git@github.com:okutani-t/dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x homebrew_install.sh install.sh
./homebrew_install.sh
./install.sh
```

## What Each Script Does

- `homebrew_install.sh`
  - Installs Homebrew if missing
  - Runs `brew update`
  - Installs or upgrades predefined formulae/casks
- `install.sh`
  - Initializes git submodules (including `oh-my-zsh`)
  - Symlinks dotfiles from `~/dotfiles` to your home directory
  - Creates `~/.gitconfig.local` from template if missing
  - Links global AI config files to dotfiles-managed files:
    - `~/.codex/AGENTS.md -> ~/dotfiles/ai/codex/AGENTS.md`
  - Copies skill files as regular files (not symlinks):
    - `~/dotfiles/ai/codex/skills/pr-review/SKILL.md -> ~/.codex/skills/pr-review/SKILL.md`
    - `~/dotfiles/ai/codex/skills/pr-review/agents/openai.yaml -> ~/.codex/skills/pr-review/agents/openai.yaml`

## Important Notes

- `install.sh` resolves source files from the script directory, so it works even if this repository is not at `~/dotfiles`.
- Existing files such as `~/.zshrc` may be replaced by symlinks.
- Existing global AI config files at the paths above may be replaced (AGENTS.md is symlinked, skill files are copied as regular files).
- PR review skill is invoked by explicitly requesting `$pr-review`.
- Review scripts before running them on non-personal machines.

## Personalization

After setup, edit local settings:

```bash
vim ~/.gitconfig.local
```

At minimum, set your own git `email`.

## Scope

This repository is not intended to be a universal dotfiles framework.  
If you want to reuse it, copy only the pieces you need.
