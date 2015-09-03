# Install homebrew cask
brew install caskroom/cask/brew-cask

# Tap custom casks
brew tap casidiablo/homebrew-custom

# Tap development versions
brew tap caskroom/versions

apps=(
    google-chrome			            # Chrome, that Google browser
    mendeley-desktop                    # Paper / citation management
    firefox                             # firefox
    transmit                            # File transmission
    appcleaner				            # Delete apps thoroughly
    spotify                             # Music streaming
    sublime-text3			            # Text editor
    seil                                # Keyboard mapper
    karabiner                           # Keyboard remapper
    skype                               # VoIP
    transmission			            # Bittorrent
    vlc                                 # Media player
    dropbox                             # Dropbox
    google-drive			            # Google Drive
    bettertouchtool                     # Hotkeys and trackpad
    flash                               # Flash player
    popcorn-time			            # Netflix for bittorrent
    calibre                             # Ebook manager
    the-unarchiver                      # Archiving utility
    silverlight                         # Install Microsoft Silverlight
    unity-web-player                    # Install Unity Web Player
    kindle                              # Install Kindle
    mactex                              # Install Mac LaTeX
    xquartz                             # GUI
    wireshark                           # Packet analyzer/sender
    flux                                # Screen management
    slack                               # Work chat app
    processing                          # Processing app
    emacs                               # text editor
    dash                                # documentation
    skim                                # PDF reader
    adobe-creative-cloud		        # Adobe
    eagle                               # EAGLE CAD
    duet                                # Share screen with ipad
    evernote                            # 
    cheatsheet                          # keyboard shortcut
)

echo "Installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}

# Copy sublime license
mkdir ~/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages

cp ./apps/subl/License.sublime_license ~/Library/Application\ Support/Sublime\ Text\ 3/Local/
wget -O ~/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages/Package\ Control.sublime-package "https://sublime.wbond.net/Package%20Control.sublime-package" 

# Key remapping
# sh ~/dotfiles/apps/seil/seil-import.sh
