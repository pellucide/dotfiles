# Install homebrew cask
brew install caskroom/cask/brew-cask

# Tap custom casks
brew tap casidiablo/homebrew-custom

apps=(
	google-chrome		# Chrome, that Google browser
	transmit			# File transmission
	appcleaner			# Delete apps thoroughly
	spotify				# Music streaming
	sublime-text		# Text editor
	seil				# Keyboard mapper
	skype				# VoIP
	transmission		# Bittorrent
	vlc					# Media player
	dropbox				# Dropbox
	google-drive		# Google Drive
	bettertouchtool		# Hotkeys and trackpad
	flash				# Flash player
	popcorn-time		# Netflix for bittorrent
)

echo "Installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}
