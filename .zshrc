# homebrew
if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# for M1 Mac
typeset -U path PATH
path=(
  /opt/homebrew/bin(N-/)
  /opt/homebrew/sbin(N-/)
  /usr/bin
  /usr/sbin
  /usr/local/bin
  /bin
  /sbin
  /usr/local/bin(N-/)
  /usr/local/sbin(N-/)
  /Library/Apple/usr/bin
)

# zsh-completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
fi

# oh-my-zsh
ZSH=$HOME/dotfiles/oh-my-zsh
# oh-my-zsh theme
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="candy"
plugins=(git rails ruby)
source $ZSH/oh-my-zsh.sh

# set locale
export LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8

# User configuration
export PATH="$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# goenv
if command -v goenv >/dev/null 2>&1; then
  eval "$(goenv init -)"
fi

# rbenv
if command -v rbenv >/dev/null 2>&1; then
  eval "$(rbenv init - zsh)"
fi

# emacs cask path
export PATH=$PATH:$HOME/.cask/bin

# imagemagick
export PATH=/usr/local/opt/imagemagick@6/bin:$PATH

# alias
alias e='emacsclient -nw -a ""'
alias e-kill='emacsclient -e "(kill-emacs)"'
alias c='open -a Google\ Chrome'
alias ctags='/usr/local/Cellar/ctags/5.8_1/bin/ctags'
alias vi=vim
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
## sudoのあとにaliasを有効にする
alias sudo='sudo '

# ruby alias
alias r=ruby
alias be="bundle exec"

# git
alias gaa='git add -A'
alias gci='git commit'
alias gst='git status'
alias gd='git diff'
alias gdn='git diff --name-only'
alias gb='git branch'
alias gpl='git pull'
alias gps='git push'
alias gl='git l'

# gnu-sed
alias sed='gsed'

# ssh-add
eval "$(ssh-add -K ~/.ssh/id_rsa > /dev/null 2>&1)"

# hub
function git(){hub "$@"}

# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# cdなしでディレクトリ移動
setopt auto_cd

# ビープ音の停止
setopt no_beep

# ビープ音の停止(補完時)
setopt nolistbeep

# cd -<tab>で以前移動したディレクトリを表示
setopt auto_pushd

# ヒストリ(履歴)を保存、数を増やす
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 直前と同じコマンドの場合は履歴に追加しない
setopt hist_ignore_dups

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# no matches foundの対応
setopt nonomatch

# キーバインディングをemacs風に(-vはvim)
bindkey -e
# bindkey -v

# zsh: permission denied
export MAILCHECK=0

if [[ "$TERM" == "dumb" ]]; then
  unsetopt zle
  unsetopt prompt_cr
  unsetopt prompt_subst
  unfunction precmd
  unfunction preexec
  PS1='$ '
fi

# zshでpecoを使うための設定
function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history
export PATH="/usr/local/opt/libxml2/bin:$PATH"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/shims:$PATH"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
# alias python='python3'

# zlib(for pyenv)
export LDFLAGS="-L/opt/homebrew/opt/zlib/lib"
export CPPFLAGS="-I/opt/homebrew/opt/zlib/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/zlib/lib/pkgconfig"

# nodeenv
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/okutani/.docker/completions $fpath)

# Stripe
fpath=(~/.stripe $fpath)

# 補完の初期化は1回だけ実行する
autoload -Uz compinit && compinit -i

export PATH="$PATH:$HOME/flutter/bin"
