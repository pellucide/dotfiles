binaries=(
	graphicsmagick	# Image manipulation library
	rename			# CLI: rename files
	trash			# CLI: send files to trash 
	tree			# CLI: view directory as tree 
	ack				# CLI: better grep
	hub				# GitHub helpers for git
	git				# Version control
	mackup			# Backup application files
)

echo "Installing brew binaries..."
brew install ${binaries[@]}

brew cleanup
