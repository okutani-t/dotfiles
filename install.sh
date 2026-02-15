#!/bin/bash

set -euo pipefail

log_step() { printf '\n[STEP] %s\n' "$1"; }
log_info() { printf '  - %s\n' "$1"; }
log_done() { printf '\n[DONE] %s\n' "$1"; }

# 実行場所のディレクトリを取得
THIS_DIR=$(cd "$(dirname "$0")"; pwd)

cd $THIS_DIR
log_step "Initialize submodules"
git submodule init
git submodule update

cat << END

**************************************************
DOTFILES SETUP STARTED! go!
**************************************************

END

log_step "Create symlinks in home directory"
for f in .??*; do
    [ "$f" = ".git" ] && continue
    [ "$f" = ".gitconfig.local.template" ] && continue
    [ "$f" = ".gitmodules" ] && continue

    ln -snf ~/dotfiles/"$f" ~/
    log_info "linked ~/$f"
done

log_step "Ensure local git config"
if [ -e ~/.gitconfig.local ]; then
    log_info "exists ~/.gitconfig.local"
else
    cp ~/dotfiles/.gitconfig.local.template ~/.gitconfig.local
    log_info "created ~/.gitconfig.local from template"
fi

# Codex/Agents のグローバル設定を dotfiles 管理に寄せる
log_step "Link global Codex/Agents files"
mkdir -p ~/.codex
mkdir -p ~/.agents/skills/pr-review
ln -snf ~/dotfiles/ai/codex/AGENTS.md ~/.codex/AGENTS.md
ln -snf ~/dotfiles/ai/agents/skills/pr-review/SKILL.md ~/.agents/skills/pr-review/SKILL.md
log_info "linked ~/.codex/AGENTS.md"
log_info "linked ~/.agents/skills/pr-review/SKILL.md"

cat << END

**************************************************
DOTFILES SETUP FINISHED! bye.
**************************************************

END
log_done "Setup complete"
