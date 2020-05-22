#! bin/bash
## setup dotfiles

# load dotfiles
echo "Clone dotfile"
git clone --quiet https://github.com/sucitw/dotfiles.git ~/.dotfiles

#load Tmux plugins
#git clone --quiet https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# symbolic link dotfiles
cd ~/.dotfiles
ln -fs `pwd`/vimrcs/basic.vim ~/.vimrc
echo "Installed the Basic Vim configuration successfully! Enjoy :-)"

ln -fs `pwd`/bash_profile  ~/.bash_profile
ln -fs `pwd`/bash_aliases  ~/.bash_aliases
echo "Update bash_profile"

ln -fs `pwd`/tmux.conf  ~/.tmux.conf
echo "Update tmux"
