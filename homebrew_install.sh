#!/bin/bash

echo "installing homebrew..."
which brew >/dev/null 2>&1 || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

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
    z
    colordiff
    "--without-etcdir zsh"
    zsh-completions
    "--with-cocoa --srgb emacs"
    cask
    ansible
    peco
    hub
    tig
    node
    python3
    lua
    "vim --with-lua"
    mysql
    postgresql
    sqlite
    psysh
    rbenv
    ruby-build
    rbenv-gem-rehash
    rbenv-default-gems
    ricty
    php
    composer
    markdown
    ctags
    ssh-copy-id
    phantomjs
    mecab
    diff-so-fancy
    "cmigemo --HEAD"
    thefuck
    the_silver_searcher
    memcached
    imagemagick@6
    libxml2
    libxslt
    libiconv
    yarn
    heroku
    awscli
    redis
    gcc
)

"brew tap..."
brew tap sanemat/font
brew tap heroku/brew

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
