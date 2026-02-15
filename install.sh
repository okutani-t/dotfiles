#!/bin/bash

set -u

# 実行場所のディレクトリを取得
THIS_DIR=$(cd $(dirname $0); pwd)

cd $THIS_DIR
git submodule init
git submodule update

echo "start setup..."
for f in .??*; do
    [ "$f" = ".git" ] && continue
    [ "$f" = ".gitconfig.local.template" ] && continue
    [ "$f" = ".gitmodules" ] && continue

    ln -snfv ~/dotfiles/"$f" ~/
done

[ -e ~/.gitconfig.local ] || cp ~/dotfiles/.gitconfig.local.template ~/.gitconfig.local

# Codex/Agents のグローバル設定を dotfiles 管理に寄せる
mkdir -p ~/.codex
mkdir -p ~/.agents/skills/pr-review
ln -snfv ~/dotfiles/ai/codex/AGENTS.md ~/.codex/AGENTS.md
ln -snfv ~/dotfiles/ai/agents/skills/pr-review/SKILL.md ~/.agents/skills/pr-review/SKILL.md

cat << END

**************************************************
DOTFILES SETUP FINISHED! bye.
**************************************************

END
