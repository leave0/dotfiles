#
#~/.zshrc
#

#Default Editor
export EDITOR="vim"

#.scripts path
export PATH=~/.scripts:$PATH

#Metasploit
export PATH=/opt/metasploit:$PATH

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

#Aliases
alias mwlan0='sudo macchanger wlan0 -m $1'
alias ls='ls --color'
alias up='sudo ifconfig wlan0 up'
alias down='sudo ifconfig wlan0 down'
alias guile='env LTDL_LIBRARY_PATH=/opt/local/lib guile'
alias lyrics='~/.scripts/01-from-harddisk.pl'
alias todo='/usr/bin/todo.sh -n -d ~/Dropbox/Public/todo.txt/todo.cfg'
alias ccompile="gcc -W -Wall -ansi -pedantic -o $1 $2"
alias shost='ssh fskonefo@fsk141.com'
alias amon='sudo modprobe -r rtl8187 && sudo modprobe r8187'
alias aumon='sudo modprobe -r r8187 && sudo modprobe rtl8187'
alias scan="sudo iwlist wlan0 scan | awk -F:= '/(ESSID|Address|Channel|Frequency|Quality|Encryption)/ { print substr(\$1,1) } '"
alias scana="sudo iwlist wlan0 scan"
alias scan1="sudo iwlist wlan1 scan | awk -F:= '/(ESSID|Address|Channel|Frequency|Quality|Encryption)/ { print substr(\$1,1) } '"
alias scan1a="sudo iwlist wlan1 scan"
alias ida="/opt/idaadv/idal"
alias ida64="/opt/idaadv/idal64"
alias invert="xcalib -invert -alter"
alias dictionary="sdcv"
alias history="history 0"

webdev () {
	if [[ "$1" == "nginx" ]]; then
		if [[ -f /var/run/httpd/httpd.pid ]]; then
			sudo rc.d stop httpd
		fi
			sudo rc.d start nginx
			sudo rc.d start php-fpm
			sudo rc.d restart mysqld
	fi

	if [[ "$1" == "httpd" ]]; then
		if [[ -f /var/run/nginx.pid ]]; then
			sudo rc.d stop nginx
			sudo rc.d stop php-fpm
		fi
			sudo rc.d start httpd
			sudo rc.d restart mysqld
	fi

	if [[ -z "$1" ]]; then
		if [[ -f /var/run/httpd/httpd.pid ]]; then
			sudo rc.d stop httpd
		fi
		if [[ -f /var/run/nginx.pid ]]; then
			sudo rc.d stop nginx
			sudo rc.d stop php-fpm
		fi
		if [[ -f /var/run/mysqld/mysqld.pid ]]; then
			sudo rc.d stop mysqld
		fi
	fi
}
