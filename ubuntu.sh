# Sublime repo
sudo add-apt-repository ppa:webupd8team/sublime-text-3\

# Chrome repo
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

sudo apt-get update

apps=(
    linux-headers-generic
    build-essential
    git
    sublime-text-installer
    google-chrome-stable
    python-pip
    autokey-qt
)

# Install Mackup with PIP and restore
sudo pip install mackup
cp mackup/.mackup.cfg ~/.mackup.cfg
mackup restore

# Install slack
sudo apt-add-repository -y ppa:rael-gc/scudcloud
sudo apt-get update
sudo apt-get install scudcloud

# Install fonts
sudo mkdir -p ~/.fonts/truetype
sudo mkdir -p ~/.fonts/truetype
sudo fc-cache -f -v

# Git
git config --global credential.helper cache

# Autokey
xmodmap -e "keysym Caps_Lock = Hyper_L" -e "keycode 66 = BackSpace" -e "remove Mod4 = Hyper_L" -e "add Mod3 = Hyper_L" -e "keycode 66 = Hyper_L"

# By hand
# - Add autokey to startup applications (automate by moving autokey.desktop to ~/.config/autostart)

# To do
# - Fix hyper key
# - Get ctrl-shift-a / e working
# - Swap windows and alt