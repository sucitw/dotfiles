#! bin/bash
## setup dotfiles

#==========
# Variables
#==========
dotfiles_dir=~/dotfiles 
log_file=~/install-progress_log.txt

#=========
# Deltet existing dot files and folders
#=========
#rm -rf ~/.vim > /dev/null 2>&1
rm -rf ~/.vimrc > /dev/null 2>&1
rm -rf ~/.bashrc > /dev/null 2>&1
rm -rf ~/.bash_profile > /dev/null 2>&1
rm -rf ~/.config > /dev/null 2>&1


#==============
# Create symlinks in the home folder
#==============
#ln -sf $dotfiles_dir/vim ~/.vim
ln -sf $dotfiles_dir/vimrcs/basic.vim ~/.vimrc
echo "Installed the Basic Vim configuration successfully! Enjoy :-)"

ln -sf $dotfiles_dir/bashrc ~/.bashrc
ln -sf $dotfiles_dir/bash_profile  ~/.bash_profile
echo "Update bash_profile, Copy bash_local if need"

#ln -sf $dotfiles_dir/linux-tmux ~/.tmux
#ln -sf $dotfiles_dir/zsh/zsh_prompt ~/.zsh_prompt
#ln -sf $dotfiles_dir/zsh/zshrc ~/.zshrc
#ln -sf $dotfiles_dir/config ~/.config
#ln -sf $dotfiles_dir/custom-configs/custom-snips ~/.vim/custom-snips

#Load Tmux plugins
#git clone --quiet https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
#ln -fs `pwd`/tmux.conf  ~/.tmux.conf
#echo "Update tmux"

#==============
# Give the user a summary of what has been installed
#==============
echo -e "\n====== Summary ======\n"
cat $log_file
echo
echo "Enjoy!"
rm $log_file

