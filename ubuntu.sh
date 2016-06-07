# Sublime repo
sudo add-apt-repository ppa:webupd8team/sublime-text-3

# Chrome repo
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

# Add slack
sudo apt-add-repository -y ppa:rael-gc/scudcloud
sudo apt-get install scudcloud

sudo apt-get update

apps=(
    linux-headers-generic
    build-essential
    git
    sublime-text-installer
    google-chrome-stable
    python-pip
    autokey-qt
    emacs
    curl
    jq
    scudcloud
    tmux
)

sudo apt-get install -y ${apps[@]}

# Install Mackup with PIP and restore
# sudo pip install mackup
cd mackup/src
sudo python setup.py install
cd ../../
cp mackup/.mackup.cfg ~/.mackup.cfg
mackup restore

# Git
git config --global credential.helper cache

# Autokey
# xmodmap -e "keysym Caps_Lock = Hyper_L" -e "keycode 66 = BackSpace" -e "remove Mod4 = Hyper_L" -e "add Mod3 = Hyper_L" -e "keycode 66 = Hyper_L"

# Docker
# wget -qO- https://get.docker.com/ | sh
# sudo usermod -aG docker floored

# TODO: move .gtkrc-2.0 to mackup
echo gtk-enable-mnemonics = 0 >> ~/.gtkrc-2.0
# http://www.bendangelo.me/linux/2015/10/15/remap-caps-lock-in-ubuntu.html
setxkbmap -option caps:super

# By hand
# - Add autokey to startup applications (automate by moving autokey.desktop to ~/.config/autostart)

# To do
# - Fix hyper key
