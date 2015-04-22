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