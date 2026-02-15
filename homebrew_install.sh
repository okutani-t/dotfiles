#!/bin/bash

set -euo pipefail

echo "installing homebrew..."
which brew >/dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "run brew doctor..."
if which brew >/dev/null 2>&1; then
    if ! brew doctor; then
        echo "brew doctor returned warnings. continue..."
    fi
fi

echo "run brew update..."
which brew >/dev/null 2>&1 && brew update

formulas=(
    git
    wget
    curl
    tree
    openssl
    colordiff
    cmigemo
    ctags
    zsh
    zsh-completions
    peco
    hub
    tig
    mysql
    postgresql
    sqlite
    yarn
    nodebrew
    python3
    lua
    vim
    rbenv
    ruby-build
    markdown
    ssh-copy-id
    diff-so-fancy
    memcached
    imagemagick@6
    gcc
    libxml2
    libxslt
    libiconv
    heroku
    awscli
    redis
)

failed_items=()
processed_count=0

echo "start brew install apps..."
for formula in "${formulas[@]}"; do
    if [[ "$formula" == --cask* ]]; then
        cask="${formula#--cask }"
        if brew list --cask --versions "$cask" >/dev/null 2>&1; then
            if ! brew upgrade --cask "$cask"; then
                failed_items+=("cask:$cask (upgrade)")
            fi
        else
            if ! brew install --cask "$cask"; then
                failed_items+=("cask:$cask (install)")
            fi
        fi
    else
        if brew list --formula --versions "$formula" >/dev/null 2>&1; then
            if ! brew upgrade "$formula"; then
                failed_items+=("formula:$formula (upgrade)")
            fi
        else
            if ! brew install "$formula"; then
                failed_items+=("formula:$formula (install)")
            fi
        fi
    fi
    processed_count=$((processed_count + 1))
done

brew cleanup

echo ""
echo "brew summary:"
echo "  processed: $processed_count"
if [ ${#failed_items[@]} -eq 0 ]; then
    echo "  failed: 0"
else
    echo "  failed: ${#failed_items[@]}"
    for item in "${failed_items[@]}"; do
        echo "    - $item"
    done
fi

cat << END

**************************************************
HOMEBREW INSTALLED! bye.
**************************************************

END

if [ ${#failed_items[@]} -ne 0 ]; then
    exit 1
fi
