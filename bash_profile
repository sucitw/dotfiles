# System Default Information

[ -z ${PLATFORM+x} ] && export PLATFORM=$(uname -s)
[ -f /etc/bashrc ] && . /etc/bashrc

## load bash setting

# source bashrc if it exists

if [ -f ~/.bashrc ]; then
    echo ".profile is sourcing " ~/.bashrc
    source ~/.bashrc
fi

        
# source bashr_local if it exists
if [ -f ~/.bash_local ]; then
    echo ".profile is sourcing " ~/.bash_local
    source ~/.bash_local
fi



#-------------------------------------------------------------------------------
# Prompt
#-------------------------------------------------------------------------------

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


#-------------------------------------------------------------------------------
# Environment Variables
#-------------------------------------------------------------------------------

# OS = MacOS or Linux-like
if [ "$PLATFORM" = 'Darwin' ]; then
  export PATH=~/bin:/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/2.7.0/bin:$GOPATH/bin:$PATH
  export EDITOR=nvim
elif [ "$PLATFORM" = Linux ]; then
    if [ -z "$var" ]; then
        export EDITOR=vim
    else
        export EDITOR=vi
  export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:.:/usr/local/lib
fi
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8



#-------------------------------------------------------------------------------
# Aliases
#-------------------------------------------------------------------------------

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias cd.='cd ..'
alias cd..='cd ..'
alias l='ls -alF'
alias ll='ls -l'
alias vi=$EDITOR
alias vim=$EDITOR
alias which='type -p'
alias k5='kill -9 %%'
alias gv='vim +GV +"autocmd BufWipeout <buffer> qall"'
### Colored ls
if [ -x /usr/bin/dircolors ]; then
  eval "`dircolors -b`"
  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
elif [ "$PLATFORM" = Darwin ]; then
  alias ls='ls -G'
fi
