sudo add-apt-repository ppa:webupd8team/sublime-text-3
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
