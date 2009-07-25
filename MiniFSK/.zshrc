#
#~/.zshrc
#

#Default Editor
export EDITOR="vi"

#ZSH Prompt
PROMPT='[%n@%M %~]$ '

#Where the history file is located
HISTFILE=~/.histfile

#Size of the history file
HISTSIZE=10000
SAVEHIST=10000

#Auto change directory's w/o 'cd'
setopt autocd

#ZLE line editor set to vi
bindkey -v


zstyle ':completion:*' completer _complete 
zstyle ':completion:*' prompt '%e'
zstyle ':completion:*' use-compctl true
zstyle :compinstall filename '/home/fsk141/.zshrc'

autoload -Uz compinit
compinit
bindkey "\e[1~" beginning-of-line
bindkey "\e[2~" quoted-insert
bindkey "\e[3~" delete-char
bindkey "\e[4~" end-of-line
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history
bindkey "\e[7~" beginning-of-line
bindkey "\e[8~" end-of-line
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
bindkey "\eOd" backward-word
bindkey "\eOc" forward-word

#Aliases
alias pacman='sudo pacman'
alias ls='ls --color=auto'
alias monitor='sh ~/.scripts/monitor.sh'
alias unmonitor='sh ~/.scripts/unmonitor.sh'
alias connect='sh ~/.scripts/connect.sh'
alias wired='sh ~/.scripts/wired'
alias wireless='sh ~/.scripts/wireless'
alias scan='sudo iwlist wlan0 scan'
alias sshfsk='ssh 10.0.0.101'
alias dropbox='~/.dropbox-dist/dropboxd &!'
alias isdropbox='ps ax | grep dropbox'
alias rewi='~/.scripts/rewi'
alias flac2mp3='~/.scripts/flac2mp3'
alias covertagger='~/.scripts/covertagger'

keychain -q id_rsa
source ~/.keychain/$HOST-sh
