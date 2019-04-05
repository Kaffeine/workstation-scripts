#!/bin/sh

DEFAULT_INSTALL_PATH="$HOME/.local/workstation-scripts"
echo -n "Select installation directory [$DEFAULT_INSTALL_PATH]: "
read INSTALL_PATH
if [ x$INSTALL_PATH = "x" ]; then
    INSTALL_PATH=$DEFAULT_INSTALL_PATH
fi

echo "Installing to $INSTALL_PATH"

mkdir -p $INSTALL_PATH
cp -rf scripts $INSTALL_PATH/
mkdir -p ~/.local/bin
ln -s $INSTALL_PATH/scripts/* ~/.local/bin

read -p "Done. Run configure [Y/n]? " yn
case "$yn" in
    ""|[Yy]* ) break;;
    * ) exit;;
esac

"$INSTALL_PATH/scripts/wss-configure"
