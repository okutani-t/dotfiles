# for M1 Mac
typeset -U path PATH
path=(
  /opt/homebrew/bin(N-/)
  /opt/homebrew/sbin(N-/)
  /usr/bin
  /usr/sbin
  /bin
  /sbin
  /usr/local/bin(N-/)
  /usr/local/sbin(N-/)
  /Library/Apple/usr/bin
)

# zsh-completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
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

# PostgreSQL
export PGDATA=/usr/local/var/postgres
export PATH=/usr/local/Cellar/postgresql/11.1/bin/:$PATH

# User configuration
export PATH="$HOME/.rbenv/shims:/usr/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="/usr/local/sbin:$PATH"

# goenv
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"

# rbenv
eval "$(rbenv init -)"

# pyenv
export PYENV_ROOT=${HOME}/.pyenv
if [ -d "${PYENV_ROOT}" ]; then
    export PATH=${PYENV_ROOT}/bin:$PATH
    eval "$(pyenv init -)"
fi

# emacs cask path
export PATH=$PATH:$HOME/.cask/bin

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

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

# for M1 Mac Homebrew path setting
eval "$(/opt/homebrew/bin/brew shellenv)"
