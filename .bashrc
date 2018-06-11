# alias
alias ls='ls -CF'
alias ll='ls -AlFh --show-control-chars --color=auto'
alias la='ls -CFal'

# git alias
alias gaa='git add -A'
alias gci='git commit'
alias gco='git checkout'
alias gd='git diff'
alias gdt='git difftool'
alias gps='git push'
alias gpl='git pull'
alias gst='git status'
alias gb='git branch'

# vagrant alias
alias vup='vagrant up'
alias vreload='vagrant reload'
alias vhalt='vagrant halt'
alias vdestroy='vagrant destroy'
alias vssh='vagrant ssh'

# hub
eval "$(hub alias -s)"

# プロンプトの表示をカスタマイズ
function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

function check-shell-command {
  if [ $? -eq 0 ]; then
    face="\e[32m(^-^)b"
  else
    face="\e[34m(+_+)"
  fi
echo -e "${face}\e[m"
}
export PS1='\[\033[01;32m\]\u@\H\[\033[01;34m\] \w$(parse_git_branch) \n $(check-shell-command): \$\[\033[00m\]'

# 履歴数
export HISTSIZE=100000

# 文字コード
export LANG='ja_JP.UTF-8'
export LC_ALL='ja_JP.UTF-8'
export LC_MESSAGES='ja_JP.UTF-8'
