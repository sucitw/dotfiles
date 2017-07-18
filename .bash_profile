# load .bash_aliases if exists
if [ -f /.bash_aliases ]; then
. /.bash_aliases
fi

export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

bind '"\x1b\x5b\x41":history-search-backward'
bind '"\x1b\x5b\x42":history-search-forward'

#export PS1='\[\033[01;36m\]\w \[\033[00m\]$ '
export color_prompt=yes

if [ "$color_prompt" = yes ]; then
    # PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    PS1="${debian_chroot:+($debian_chroot)}[\[\e[0;34m\]\u\e[0;37m\]@\e[0;32m\]\h, \e[0;33m\]\load: `cat /proc/loadavg | awk '{ print $1; }'`\[\e[00m\]] (\[\e[00;35m\]\d - \t\[\e[00m\])\n\w \$ "
else
    # PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    PS1="${debian_chroot:+($debian_chroot)}[\u@\h, load: `cat /proc/loadavg | awk '{ print $1; }'`] (\d - \t)\n\w \$ "
fi
unset color_prompt force_color_prompt