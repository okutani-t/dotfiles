#!/bin/bash

echo "installing homebrew..."
which brew >/dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "run brew doctor..."
which brew >/dev/null 2>&1 && brew doctor

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
    "--cask emacs"
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

echo "start brew install apps..."
for formula in "${formulas[@]}"; do
    if [[ "$formula" == --cask* ]]; then
        cask="${formula#--cask }"
        if brew list --cask --versions "$cask" >/dev/null 2>&1; then
            brew upgrade --cask "$cask"
        else
            brew install --cask "$cask"
        fi
    else
        if brew list --formula --versions "$formula" >/dev/null 2>&1; then
            brew upgrade "$formula"
        else
            brew install "$formula"
        fi
    fi
done

brew cleanup

cat << END

**************************************************
HOMEBREW INSTALLED! bye.
**************************************************

END
