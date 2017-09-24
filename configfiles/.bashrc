# ---B--------------B---------------------------------------B--------------B--- #
# ---------------------- SSSSSSS AAAAAAA GGGGGGG EEEEEEE ---------------------- #
# ---A--------------A--- S       A     A G       E       ---A--------------A--- #
# ---------------------- SSSSSSS AAAAAAA GGGGGGG EEEEEEE ---------------------- #
# ---S--------------S---       S A     A G     G E       ---S--------------S--- #
# ---------------------- SSSSSSS A     A GGGGGGG EEEEEEE ---------------------- #
# ---H--------------H---------------------------------------H--------------H--- #

# ------ CONTENTS ------ #
# 1. Prompt
# 2. Config
# 3. Layout
# 4. Aliases
# 5. Functions
# 6. Exports
# -----------------------#

# ----------------------------------------------------------------------------- #
# -------------------------------- P R O M P T -------------------------------- #
# ----------------------------------------------------------------------------- #

gb () {
  git branch 2> /dev/null | sed -e 's/\(.*\)/\n⑂ \1 /'
}
gl () {
  git log --oneline -n 1 2> /dev/null | sed -e 's/\(.*\)/✎ \1 /'
}
HOURGLASS='⧖'
COMPASS='✧'
export PS1="\n\[$HOURGLASS\] \t \[$COMPASS\] \w \$(gb)\$(gl)\n \! > "

# ----------------------------------------------------------------------------- #
# -------------------------------- C O N F I G -------------------------------- #
# ----------------------------------------------------------------------------- #

export LANG=en_US.UTF-8 # Set Locale
set -o vi               # Turn vi mode on

# ----------------------------------------------------------------------------- #
# -------------------------------- L A Y O U T -------------------------------- #
# ----------------------------------------------------------------------------- #

# -> HOME <- #
mkdir -p ~/documents
mkdir -p ~/downloads
mkdir -p ~/pictures
mkdir -p ~/videos
mkdir -p ~/music
mkdir -p ~/graphics
mkdir -p ~/code/pkg
mkdir -p ~/code/bin
mkdir -p ~/code/src/github.com/ericsage

# -> VIM <-#
mkdir -p ~/.vim/backup
mkdir -p ~/.vim/tmp
mkdir -p ~/.vim/undo

# ----------------------------------------------------------------------------- #
# ------------------------------- A L I A S E S ------------------------------- #
# ----------------------------------------------------------------------------- #

# -> MOVEMENT <- #
alias ~='cd ~'
alias ..='cd ../'
alias ...='cd ../../'

alias doc='cd ~/documents'
alias documents='cd ~/documents'

alias dow='cd ~/downloads'
alias downloads='cd ~/downloads'

alias pic='cd ~/pictures'
alias pictures='cd ~/pictures'

alias vid='cd ~/videos'
alias videos='cd ~/videos'

alias mus='cd ~/music'
alias music='cd ~/music'

alias gra='cd ~/graphics'
alias graphics='cd ~/graphics'

alias c='cd ~/code/src/github.com/ericsage'
alias code='cd ~/code/src/github.com/ericsage'

# -> VIM <- #
alias v='vim'
alias vi='vim'

# -> GIT <- #
alias g="git"

# -> DOTFILES <- #
alias evi='vim ~/.vimrc'
alias ebash='vim ~/.bash_rc'
alias egit='vim ~/.gitconfig'

# -> TMUX <- #
alias t='tmux -u2'
alias tmux='tmux -u2'
alias tn='tmux new -s'
alias ta='tmux attach -t'
alias ts='tmux switch -t'
alias twn='tmux new-window'
alias tws='tmux select-window'
alias tv='tmux split-window'
alias th='tmux split-window -h'
alias tl='tmux list-sessions'

# -> DOCKER <- #
alias d='docker'
alias dc='docker-compose'
alias dm='docker-machine'

# -> KUBERNETES <- #
alias k='kubectl'

# ----------------------------------------------------------------------------- #
# ----------------------------- F U N C T I O N S ----------------------------- #
# ----------------------------------------------------------------------------- #

# ----------------------------------------------- #
# -> dkill: Kill and remove a container <- #
dkill () { eval "$(docker kill $1 && docker rm $1)" ; }
# ----------------------------------------------- #

# ----------------------------------------------- #
# -> mans: Search manpage from first argument for term in second argument <- #
mans () { man $1 | grep -iC2 --color=always $2 | less ; }
# ----------------------------------------------- #

# ----------------------------------------------- #
# -> httpHeaders: Grabs headers from web page <- #
httpHeaders () { /usr/bin/curl -I -L $@ ; }
# ----------------------------------------------- #

# ----------------------------------------------- #
# -> httpDebug: Download a web page and show info on what took time <- #
httpDebug () { /usr/bin/curl $@ -o /dev/null -w "dns: %{time_namelookup} connect: %{time_connect} pretransfer: %{time_pretransfer} starttransfer: %{time_starttransfer} total: %{time_total}\n" ; }
# ----------------------------------------------- #

# ----------------------------------------------------------------------------- #
# ------------------------------- E X P O R T S ------------------------------- #
# ----------------------------------------------------------------------------- #

export LESS='R'
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
export GOPATH=/root/Code
export PATH=$PATH:$HOME/Code/bin

# ----------------------------------------------------------------------------- #

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/usr/lib/google-cloud-sdk/path.bash.inc' ]; then source '/usr/lib/google-cloud-sdk/path.bash.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/usr/lib/google-cloud-sdk/completion.bash.inc' ]; then source '/usr/lib/google-cloud-sdk/completion.bash.inc'; fi
