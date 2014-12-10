# Tap fonts
brew tap caskroom/fonts

# fonts
fonts=(
  font-m-plus
  font-clear-sans
  font-roboto
)

# Install free fonts
echo "Installing fonts..."
brew cask install ${fonts[@]}

# Install non-free fonts
cp ./fonts/* ~/Library/Fonts