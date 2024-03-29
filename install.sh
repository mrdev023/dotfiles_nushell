#!/bin/sh

# Absolute path to this script, e.g. /home/user/bin/foo.sh
SCRIPT=$(readlink -f "$0")
# Absolute path this script is in, thus /home/user/bin
SCRIPTPATH=$(dirname "$SCRIPT")

zoxide init nushell > ~/.zoxide.nu
starship init nu > ~/.starship.nu

rm -rf "$HOME/.config/nushell"
ln -s "$SCRIPTPATH/nushell" "$HOME/.config/nushell"

rm -rf "$HOME/.asdf"
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.3

nu --config "$SCRIPTPATH/nushell/config.nu" --env-config "$SCRIPTPATH/nushell/env.nu" "$SCRIPTPATH/configure.nu"

echo -e "\nFILE ADDED: "
echo -e "\t$HOME/.zoxide.nu"
echo -e "\t$HOME/.starship.nu"

echo -e "\nFOLDER LINKED: "
echo -e "\t$SCRIPTPATH/nushell -> $HOME/.config/nushell"

echo -e "\nFOLDER ADDED: "
echo -e "\t$HOME/.asdf"
