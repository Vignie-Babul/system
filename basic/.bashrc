#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'


# -----------------------------------------------

# current git branch  $(__git_ps1 "(%s)")
. /usr/share/git/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=1

# rgb(227, 25, 45)   : Scarlet
# rgb(88, 129, 87)   : Fern Green
# user@hostname ~  $ 
# user@hostname ~ (branch) $ 
PS1='\[\e[38;2;227;25;45m\]\u\[\e[0m\]'\
'@\h '\
'\W '\
'\[\e[38;2;88;129;87m\]$(__git_ps1 "(%s)")\[\e[0m\] '\
'\$ '


# ^L bind
clear_screen_and_scrollback() {
	printf '\e[H\e[3J'
}
bind -x '"\C-l":"clear_screen_and_scrollback"'

# -----------------------------------------------


. "$HOME/.cargo/env"
