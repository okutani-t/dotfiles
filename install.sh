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

cat << END

**************************************************
DOTFILES SETUP STARTED! go!
**************************************************

END

log_step "Create symlinks in home directory"
for f in .??*; do
    [ "$f" = ".git" ] && continue
    [ "$f" = ".codex" ] && continue
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
ensure_real_dir ~/.codex/prompts
ensure_real_dir ~/.codex/skills

if [ ! -f "$THIS_DIR/ai/codex/AGENTS.md" ]; then
    echo "[ERROR] $THIS_DIR/ai/codex/AGENTS.md does not exist."
    exit 1
fi

ln -snf "$THIS_DIR/ai/codex/AGENTS.md" ~/.codex/AGENTS.md
log_info "linked ~/.codex/AGENTS.md"

shopt -s nullglob

for skill_file in "$THIS_DIR"/ai/codex/skills/*/SKILL.md; do
    if [ -L "$skill_file" ]; then
        echo "[ERROR] $skill_file must be a regular file."
        exit 1
    fi

    skill_name=$(basename "$(dirname "$skill_file")")
    mkdir -p "$HOME/.codex/skills/$skill_name"
    sync_regular_file "$skill_file" "$HOME/.codex/skills/$skill_name/SKILL.md"
    log_info "copied ~/.codex/skills/$skill_name/SKILL.md"
done

for prompt_file in "$THIS_DIR"/ai/codex/prompts/*.md; do
    if [ -L "$prompt_file" ]; then
        echo "[ERROR] $prompt_file must be a regular file."
        exit 1
    fi

    prompt_name=$(basename "$prompt_file")
    sync_regular_file "$prompt_file" "$HOME/.codex/prompts/$prompt_name"
    log_info "copied ~/.codex/prompts/$prompt_name"
done

# Claude Code のグローバル設定を dotfiles 管理に寄せる
log_step "Link global Claude files"
ensure_real_dir ~/.claude

if [ ! -f "$THIS_DIR/ai/claude/CLAUDE.md" ]; then
    echo "[ERROR] $THIS_DIR/ai/claude/CLAUDE.md does not exist."
    exit 1
fi

sync_regular_file "$THIS_DIR/ai/claude/CLAUDE.md" "$HOME/.claude/CLAUDE.md"
log_info "copied ~/.claude/CLAUDE.md"

cat << END

**************************************************
DOTFILES SETUP FINISHED! bye.
**************************************************

END
log_done "Setup complete"
