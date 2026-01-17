#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

# RGB(227, 25, 45) - red
# user@hostname ~ $ 
PS1='\[\e[38;2;227;25;45m\]\u\[\e[0m\]@\h \W \$ '

# ^L bind
clear_screen_and_scrollback() {
	printf '\e[H\e[3J'
}

bind -x '"\C-l":"clear_screen_and_scrollback"'
