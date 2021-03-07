# Installs the dotfiles.
# Copies dot to the local bin folder.
dotfiles_home=$(pwd)
dotfiles_home_bin=$(echo $dotfiles_home)/bin

# The echo is very important. Without echo'ing bash will attempt to run dotfiles_home,
# which is not what we wanted to do
dotfiles_check=$(echo $dotfiles_home | awk -F / '{ print $(NF) }')

# This is a good enough check for me.
if [ "$dotfiles_check" != "dotfiles" ]; then
    echo "You must be in the dotfiles directory"
    exit
fi

echo $dotfiles_home_bin

echo -n "export PATH=$(echo $dotfiles_home_bin)"':$PATH' >> ~/.zshrc
