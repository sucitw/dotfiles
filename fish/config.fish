# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG "/Users/shuhsi/.config/omf"


# adding path function
function add_to_path --description 'Persistently prepends paths to your PATH'
  set --universal fish_user_paths $fish_user_paths $argv
end

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

##add customized path

# anaconda
add_to_path $PATH ~/anaconda/bin
