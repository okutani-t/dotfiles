#!/bin/bash

set -euo pipefail

log_step() { printf '\n[STEP] %s\n' "$1"; }
log_info() { printf '  - %s\n' "$1"; }
log_done() { printf '\n[DONE] %s\n' "$1"; }

# 指定ファイルを通常ファイルとして同期する（リンクは作らない）
sync_regular_file() {
    local src="$1"
    local dst="$2"

    mkdir -p "$(dirname "$dst")"

    if [ -L "$dst" ]; then
        rm -f "$dst"
    fi

    cp -f "$src" "$dst"
}

# 指定パスがシンボリックリンク/通常ファイルなら退避して実ディレクトリ化する
ensure_real_dir() {
    local dir="$1"
    local backup

    if [ -L "$dir" ] || [ -f "$dir" ]; then
        backup="${dir}.bak.$(date +%Y%m%d%H%M%S)"
        mv "$dir" "$backup"
        log_info "moved $dir to $backup"
    fi

    mkdir -p "$dir"
}

# 実行場所のディレクトリを取得
THIS_DIR=$(cd "$(dirname "$0")"; pwd)

cd "$THIS_DIR"
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

    ln -snf "$THIS_DIR/$f" ~/
    log_info "linked ~/$f"
done

log_step "Ensure local git config"
if [ -e ~/.gitconfig.local ]; then
    log_info "exists ~/.gitconfig.local"
else
    cp "$THIS_DIR/.gitconfig.local.template" ~/.gitconfig.local
    log_info "created ~/.gitconfig.local from template"
fi

log_step "Ensure global git ignore config"
git config --global core.excludesfile "~/.gitignore_global"
log_info "set core.excludesfile to ~/.gitignore_global"

# Codex のグローバル設定を dotfiles 管理に寄せる
log_step "Link global Codex files"
mkdir -p ~/.codex
ensure_real_dir ~/.codex/skills
mkdir -p ~/.codex/skills/pr-review

if [ -L "$THIS_DIR/ai/codex/skills/pr-review/SKILL.md" ]; then
    echo "[ERROR] $THIS_DIR/ai/codex/skills/pr-review/SKILL.md must be a regular file."
    exit 1
fi

if [ ! -f "$THIS_DIR/ai/codex/AGENTS.md" ]; then
    echo "[ERROR] $THIS_DIR/ai/codex/AGENTS.md does not exist."
    exit 1
fi

if [ ! -f "$THIS_DIR/ai/codex/skills/pr-review/SKILL.md" ]; then
    echo "[ERROR] $THIS_DIR/ai/codex/skills/pr-review/SKILL.md does not exist."
    exit 1
fi

ln -snf "$THIS_DIR/ai/codex/AGENTS.md" ~/.codex/AGENTS.md
sync_regular_file "$THIS_DIR/ai/codex/skills/pr-review/SKILL.md" ~/.codex/skills/pr-review/SKILL.md
log_info "linked ~/.codex/AGENTS.md"
log_info "copied ~/.codex/skills/pr-review/SKILL.md"

cat << END

**************************************************
DOTFILES SETUP FINISHED! bye.
**************************************************

END
log_done "Setup complete"
