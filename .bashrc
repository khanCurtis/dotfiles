#
# ~/.bashrc
#

eval "$(starship init bash)"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='exa --icons -F -H --group-directories-first --git -1'
alias grep='grep --color=auto'

PS1='[\u@\h \W]\$ '



neofetch

. "$HOME/.cargo/env"
