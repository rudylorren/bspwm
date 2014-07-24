#my.bashrc
if [[ $- != *i* ]] ; then
	return
fi

alias path='echo -e ${PATH//:/\\n}'
# Aliases to save time & typing:
alias please='eval "sudo $(fc -ln -1)"'
alias hoff='sudo shutdown now -H'
alias sdr='sudo shutdown now -r'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -I'                    # 'rm -i' prompts for every file
alias ln='ln -i'
alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias webrip="wget -r --no-parent -k"
alias exit="clear; exit"
alias c="clear"
alias x="startx"
alias ..="cd .."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."
alias tree='tree -dA'
alias kill9='kill -9 $1'
alias ka="killall"
alias al="alias"
alias llm="ls -lh"
alias h="htop"
alias a="alsamixer"
alias m="sudo mount -a"
alias lsid='ls -lah /dev/disk/by-id/'
alias grep='grep --color=tty -d skip'
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias suod='sudo'
alias stupidfonts='xset +fp /usr/share/fonts/gohu && xset +fp /usr/share/fonts/terminus && xset fp rehash'
# Bash Options
complete -cf sudo  # Sets bash completion
# shopt (shell options) - comments are too brief & ambigous - see man page:
shopt -s autocd         # automatically cd's to path entered at the prompt   
shopt -s cdspell      # corrects minor spelling errors in when using cd
shopt -s checkwinsize      # as the name says - after each bash command
shopt -s cmdhist      # attempts to save multiple line commands in the history
shopt -s dotglob      # includes <.dot> files in file name expansion if poss'
shopt -s expand_aliases      # aliases are expanded
shopt -s extglob      # the extended pattern matching enabled
shopt -s histappend      # history from exited shell kept for next open shell 
shopt -s hostcomplete      # host name completion when @ is in the word
shopt -s nocaseglob      # case-insensitive when performing filename expansion

export HISTSIZE=90000      # sets the size of the bash history file
export HISTFILESIZE=${HISTSIZE}
export HISTCONTROL=ignoreboth

# history completion using the arrow keys:

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# ex - archive extractor   # command line archive extractor, came with Manjaro 
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
      case $1 in
          *.tar.bz2)   tar xjf $1   ;;
          *.tar.gz)    tar xzf $1   ;;
          *.bz2)       bunzip2 $1   ;;
          *.rar)       unrar x $1     ;;
          *.gz)        gunzip $1    ;;
          *.tar)       tar xf $1    ;;
          *.tbz2)      tar xjf $1   ;;
          *.tgz)       tar xzf $1   ;;
          *.zip)       unzip $1     ;;
          *.Z)         uncompress $1;;
          *.7z)        7z x $1      ;;
          *)           echo "'$1' cannot be extracted via ex()" ;;
      esac
  else
    echo "'$1' is not a valid file"
  fi
}

cl() {
if [ -d "$1" ]; then
   cd "$1"
   ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F   
   else
   echo "bash: cl: '$1': Directory not found"
fi
}

cm() {
if [ -d "$1" ]; then
   cd "$1"
   ls | more
   else
   echo "bash: cl: '$1': Directory not found"
fi
}

conf() {

case $1 in
bspwm)		vim ~/.config/bspwm/bspwmrc ;;
sxhkd)  	vim ~/.config/sxhkd/sxhkdrc ;;
2bwm)		vim ~/gitrepos/2bwm/config.h ;;
i3)	    	vim ~/.i3/config ;;
panel)      vim ~/.config/bspwm/panel ;;
paneldzen)  vim ~/.config/bspwm/panel_dzen2 ;;
pcolors)    leafpad ~/.config/bspwm/panel_colors ;;
xinit)  	vim ~/.xinitrc ;;
xresource)  vim ~/.Xresources && xrdb ~/.Xresources ;;
bashrc) 	vim ~/.bashrc && source ~/.bashrc ;;
make)       sudo vim /etc/make.conf ;;
pkguse)     sudo vim /etc/portage/package.use ;;
shblah)     sudo vim /usr/share/vim/vim74/colors/shblah.vim ;;
compton) 	vim ~/.config/compton.conf && killall compton && compton -b ;;
mpd)    	sudo vim /etc/mpd.conf ;;
fstab)      sudo vim /etc/fstab ;;
ncmpcpp) 	vim ~/.ncmpcpp/config ;;
vim)    	sudo vim /etc/vimrc ;;
conky)  	vim ~/.config/bspwm/conkyrc ;;
tmux)   	vim ~/.tmux.conf ;;
openbox) 	vim ~/.config/openbox/rc.xml ;;
*)      	echo "Unknown application: $1" ;;
esac
}

export PS1="\[\e[33;1m\]\w> \[\e[0m\]"
