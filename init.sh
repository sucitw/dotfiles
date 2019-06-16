#! bin/bash
## setup dotfiles

# load dotfiles
git clone --quiet https://github.com/sucitw/dotfiles.git ~/.dotfiles

#load Tmux plugins
#git clone --quiet https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# symbolic link dotfiles
cd ~/.dotfiles
ln -fs `pwd`/vimrc/basic.vim ~/.vimrc
echo "Installed the Basic Vim configuration successfully! Enjoy :-)"

