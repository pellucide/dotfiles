packages=(
  gulp          # Task runner
  nodemon       # Monitor
  browserify    # JS packager
  browser-sync  # Synchronize browser for dev
)

echo "Installing web stuff..."
npm install -g ${packages[@]}


