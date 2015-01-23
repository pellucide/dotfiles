binaries=(
	graphicsmagick	# Image manipulation library
	rename			    # CLI: rename files
	trash			      # CLI: send files to trash 
	tree			      # CLI: view directory as tree 
	ack				      # CLI: better grep
	hub				      # GitHub helpers for git
	git				      # Version control
  dockutil        # Manage OS X dock
  autoconf        # Autotools
  automake        # Autotools
  node            # Node.js
)

echo "Installing brew binaries..."
brew install ${binaries[@]}

brew cleanup
