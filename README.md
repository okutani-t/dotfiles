# dotfiles

Personal macOS dotfiles for zsh, git, vim, and emacs.

## Requirements

- macOS
- `git`
- Home directory write permission

## Setup

```bash
git clone git@github.com:okutani-t/dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x homebrew_install.sh install.sh
./homebrew_install.sh
./install.sh
```

## Scripts

- `homebrew_install.sh`: Installs Homebrew (if needed), runs `brew update`, then installs/upgrades predefined packages.
- `install.sh`: Creates symlinks from this repo to `~/`, ensures `~/.gitconfig.local`, links `~/.codex/AGENTS.md`, and copies Codex skill/prompt files.

## Notes

- `install.sh` uses its own location as base path, so it works even if the repo is not at `~/dotfiles`.
- Existing files such as `~/.zshrc` and `~/.codex/AGENTS.md` may be replaced.
- Use `$pr-review` to invoke the PR review skill.

## Customize

```bash
vim ~/.gitconfig.local
```

At minimum, set your git `email`.
