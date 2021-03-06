###############################################################################
# Dock, Dashboard, and hot corners                                            
###############################################################################

# Remove the auto-hiding Dock delay
defaults write com.apple.dock autohide-delay -float 0
# Remove the animation when hiding/showing the Dock
defaults write com.apple.dock autohide-time-modifier -float 0

# Set the icon size of Dock items to 36 pixels
defaults write com.apple.dock tilesize -int 36

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Remove all icons from dock
dockutil --remove all

# Add Downloads folder to other section and view as fan sorted by date modified
dockutil --add ~/Downloads --section others --view fan --sort dateadded --display stack

###############################################################################
# Trackpad, mouse, keyboard, Bluetooth accessories, and input                 
###############################################################################

# Disable “natural” (Lion-style) scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Increase sound quality for Bluetooth headphones/headsets
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

# Cancel three-finger tap
# Cancel three-finger horizontal swipe
# Cancel three-finger vertical swipe

# Use all F1, F2, etc. keys as standard function keys
# defaults write -g com.apple.keyboard.fnState -boolean true

###############################################################################
# SSD-specific tweaks                                                         
###############################################################################

# Disable local Time Machine snapshots
# sudo tmutil disablelocal

# Disable hibernation (speeds up entering sleep mode)
# sudo pmset -a hibernatemode 3

# Remove the sleep image file to save disk space
# sudo rm /Private/var/vm/sleepimage
# Create a zero-byte file instead…
# sudo touch /Private/var/vm/sleepimage
# …and make sure it can’t be rewritten
# sudo chflags uchg /Private/var/vm/sleepimage

# Disable the sudden motion sensor as it’s not useful for SSDs
# sudo pmset -a sms 0

###############################################################################
# Terminal
###############################################################################

# Only use UTF-8 in Terminal.app
defaults write com.apple.Terminal StringEncodings -array 4

# Use the Pro theme by default in Terminal.app
defaults write com.apple.Terminal 'Default Window Settings' -string "Pro";
defaults write com.apple.Terminal 'Startup Window Settings' -string "Pro";

###############################################################################
# Finder
###############################################################################

# Show all files
defaults write com.apple.finder AppleShowAllFiles 1

# Show all filename extensions in Finder
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Disable disk image verification
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

# Automatically open a new Finder window when a read only volume is mounted
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool false

# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Show the ~/Library folder
chflags nohidden ~/Library

###############################################################################
# QuickTime
###############################################################################

# Disable recent items in Quicktime
defaults write com.apple.QuickTimePlayerX NSRecentDocumentsLimit 0
defaults delete com.apple.QuickTimePlayerX.LSSharedFileList RecentDocuments
defaults write com.apple.QuickTimePlayerX.LSSharedFileList RecentDocuments -dict-add MaxAmount 0

###############################################################################
# Menu bar
###############################################################################

# Show remaining battery percentage
defaults write com.apple.menuextra.battery ShowPercent -string "YES"
defaults write com.apple.menuextra.battery ShowTime -string "YES"

###############################################################################
# Security settings
###############################################################################

# Allow opening apps from anywhere
sudo spctl --master-disable

###############################################################################
# Default applications
###############################################################################


###############################################################################
# Kill affected applications                                                  #
###############################################################################

for app in "Activity Monitor" "Dock" "Finder" "SystemUIServer"; do
  killall "${app}" > /dev/null 2>&1
done
echo "Done. Note that some of these changes require a logout/restart to take effect."
