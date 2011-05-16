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
alias ls='ls --color'
alias guile='env LTDL_LIBRARY_PATH=/opt/local/lib guile'
alias lyrics='~/.scripts/01-from-harddisk.pl'
alias todo='~/Dropbox/Public/todo.txt_cli-2.7/todo.sh -n -d ~/Dropbox/Public/todo.txt_cli-2.7/todo.cfg'
alias ccompile="gcc -W -Wall -ansi -pedantic -o $1 $2"
alias android="~/Android_dev/android-sdk-mac_86/tools/android"
alias adb="~/Android_dev/android-sdk-mac_86/platform-tools/adb"
alias shost='ssh -R 7106:localhost:7106 fskonefo@fsk141.com'
alias amon='sudo modprobe -r rtl8187 && sudo modprobe r8187'
alias aumon='sudo modprobe -r r8187 && sudo modprobe rtl8187'
alias scan="sudo iwlist wlan0 scan | awk -F:= '/(ESSID|Address|Channel|Frequency|Quality|Encryption)/ { print substr(\$1,1) } '"
alias scana="sudo iwlist wlan0 scan"
alias scan1="sudo iwlist wlan1 scan | awk -F:= '/(ESSID|Address|Channel|Frequency|Quality|Encryption)/ { print substr(\$1,1) } '"
alias scan1a="sudo iwlist wlan1 scan"
alias ida="/opt/idaadv/idal"
alias ida64="/opt/idaadv/idal64"
alias webdev="sudo /etc/rc.d/httpd restart && sudo /etc/rc.d/mysqld restart"
alias invert="xcalib -invert -alter"

wcrack () {
	sudo wifite -i wlan1 -console -d /home/fsk141/wordlists/AmiddasRevisedList.txt -wepw 10 -wpaw 5 -anon -pps 600 -e $1
}

rpass () {
	if [[ -n $1 ]]; then
	cat /dev/urandom | tr -cd \[:graph:\] | fold -w $1 | head -n $2
	else
		echo "Usage:"
		echo "     rpass [number of chars] [number of passwords]"
	fi
}

enterbt () {
	sudo chroot /home/fsk141/chroot/bt4 /bin/bash
}

mountbt () {
	# Mount system dirs
	sudo mount --bind /dev/ /home/fsk141/chroot/bt4/dev
	sudo mount --bind /dev/pts /home/fsk141/chroot/bt4/dev/pts
	sudo mount -t proc /proc /home/fsk141/chroot/bt4/proc
}

umountbt () {
	# Unmount /proc & /dev
	sudo umount /home/fsk141/chroot/bt4/dev
	sudo umount /home/fsk141/chroot/bt4/dev/pts
	sudo umount /home/fsk141/chroot/bt4/proc
}
