#!/bin/bash

echo "installing homebrew..."
which brew >/dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "run brew doctor..."
which brew >/dev/null 2>&1 && brew doctor

echo "run brew update..."
which brew >/dev/null 2>&1 && brew update

echo "ok. run brew upgrade..."

which brew >/dev/null 2>&1 && brew upgrade

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
    cask
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
    brew install $formula || brew upgrade $formula
done

brew cleanup

cat << END

**************************************************
HOMEBREW INSTALLED! bye.
**************************************************

END
