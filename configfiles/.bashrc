# -B----------B---------------------------------------B----------B- #
# ---------------- SSSSSSS AAAAAAA GGGGGGG EEEEEEE ---------------- #
# -A----------A--- S       A     A G       E       ---A----------A- #
# ---------------- SSSSSSS AAAAAAA GGGGGGG EEEEEEE ---------------- #
# -S----------S---       S A     A G     G E       ---S----------S- #
# ---------------- SSSSSSS A     A GGGGGGG EEEEEEE ---------------- #
# -H----------H---------------------------------------H----------H- #

# ----> CONTENTS <---- #
# 1. Prompt
# 2. Config
# 3. Layout
# 4. Aliases
# 5. Functions
# 6. Exports
# 7. Sourcing
# -------------------- #

# --------------------------------- #
# ---------> P R O M P T <--------- #
# --------------------------------- #
PROMPT_COMMAND=__prompt_command

__prompt_command() {
  local exit="$?"

  local compass='✧'
  local hourglass='⧖'
  local success='⚐'
  local failed='⚑'

  PS1=""
  PS1+="\[$hourglass\] \t \[$compass\] \w"
  PS1+=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\n⑂ \1 /')
  PS1+=$(git log --oneline -n 1 2> /dev/null | sed -e 's/\(.*\)/✎ \1 /')
  PS1+="\n"
  PS1+=$(if [ $exit -eq 0 ]; then echo $success; else echo "$failed"; fi)
  PS1+=" \! -> "
}
# --------------------------------- #

# --------------------------------- #
# ---------> C O N F I G <--------- #
# --------------------------------- #

# ----> EDITING <---- #
# > Turn vi mode on
set -o vi

# ----> OPTIONS <---- #
# > Cd when command is a path
shopt -s autocd

# ----> HISTORY <---- #
# > Save every command in the history list
HISTSIZE=
# > Never truncate the history list
HISTFILESIZE=

# --------------------------------- #

# ---------------------------------- #
# ----------> L A Y O U T <--------- #
# ---------------------------------- #

# ----> DEVELOPMENT <---- #
mkdir -p $HOME/code/{pkg,bin,src}
mkdir -p $HOME/code/src/github.com/ericsage
# ----------------------- #

# ----> NOTES <---- #
mkdir -p $HOME/notes
# ----------------- #

# ----> SECRETS <---- #
mkdir -p $HOME/.secrets/keys
# ------------------- #

# ----> VIM <---- #
mkdir -p $HOME/.vim/{backup,tmp,undo}
# --------------- #

# ---------------------------------- #

# ------------------------------------ #
# ----------> A L I A S E S <--------- #
# ------------------------------------ #

# ----> MOVEMENT <---- #
alias ~='cd ~'
alias ..='cd ../'
alias ...='cd ../../'

alias code='cd ~/code/src'
alias notes='cd ~/notes'
alias sage='cd ~/code/src/github.com/ericsage'

alias keys='cd ~/.secrets/keys'
# -------------------- #

# ----> VIM <---- #
alias v='vim'
alias vi='vim'
alias vs='vim -O'
# --------------- #

# ----> GIT <---- #
alias g='git'
# --------------- #

# ----> HISTORY <---- #
alias gh='history | grep'
# ------------------- #

# ----> DOTFILES <---- #
alias evi='vim ~/.vimrc'
alias ebash='vim ~/.bashrc'
alias egit='vim ~/.gitconfig'
alias etmux='vim ~/.tmux.conf'
# -------------------- #

# ----> TMUX <---- #
alias tmux='tmux -u2'
alias tm='tmux -u2'
alias tn='tmux new -s'
alias ta='tmux attach -t'
alias td='tmux detach'
alias ts='tmux switch -t'
alias tk='tmux kill-session -t'
alias tl='tmux list-sessions'
alias twn='tmux new-window'
alias tws='tmux select-window'
alias tv='tmux split-window'
alias th='tmux split-window -h'
alias tr='tmux rename-window'
# ---------------- #

# ------------------------------------ #

# --------------------------------------- #
# ---------> F U N C T I O N S <--------- #
# --------------------------------------- #
# Functions contains small utility functions.

# > dkill: Kill and remove a container
dkill () { eval "$(docker kill $1 && docker rm $1)" ; }

# > mans: Search manpage from first argument for term in second argument
mans () { man $1 | grep -iC2 --color=always $2 | less ; }

# > httpHeaders: Grabs headers from web page <---- #
httpHeaders () { /usr/bin/curl -I -L $@ ; }

# > httpDebug: Download a web page and show info on what took time
httpDebug () {
  /usr/bin/curl $@ -o /dev/null -w "
  dns: %{time_namelookup}
  connect: %{time_connect}
  pretransfer: %{time_pretransfer}
  starttransfer: %{time_starttransfer}
  total: %{time_total}\n
  " ;
}
# --------------------------------------- #

# ----------------------------------- #
# ---------> E X P O R T S <--------- #
# ----------------------------------- #
# Exports sets bash environment variables.

# ----> GENERAL <---- #
export LANG=en_US.UTF-8
export PATH=$PATH:$HOME/code/bin
export SAGE=$HOME/code/src/github.com/ericsage
# ------------------- #

# ----> GO <---- #
export GOPATH=$HOME/code
# -------------- #

# ----> LESS <---- #
export LESS='R'
# ---------------- #

# ----> FZF <---- #
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS='--preview
"(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null |
  head -200"'
# --------------- #

# ----------------------------------- #

# --------------------------------------- #
# --------->  S O U R C I N G  <--------- #
# --------------------------------------- #
# Sourcing is used to source external bash scripts.

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# --------------------------------------- #

# ----------------------------------------------------------------- #
