# Installation
Run the following in Terminal on a new OS X machine:
```
curl danielsuo.com/boot | sh
```

# To Do
- Set up login items (e.g., better touch tool)
- Add octaverc
- Reorganize install scripts
- Set up git config  (e.g., user/pass)
  ```
  ssh-keygen -t rsa -C danielsuo@gmail.com -P G1thubP@ss -f ~/.ssh/github_rsa
  echo "TODO: Paste your public key to https://github.com/settings/ssh"
  pbcopy < ~/.ssh/github_rsa.pub
  ssh-add ~/.ssh/github_rsa
  ```
- OS X set up https://gist.github.com/brandonb927/3195465
- Turn off auto spell correct
- 'SSH': ['.ssh/config', '.ssh/known_hosts'],
- set up bettertouch tool
- git autocomplete
- cancel gestures

# Manual setup items to automate
- Caps Lock -> Ctrl (defaults write doesn't seem to work)
- Add bettertouchtool to startup items (defaults write doesn't seem to work)
- Install Sublime Package Controls
- Privacy access for Karabiner, BTT
- Turn off three finger tap to define
- Turn off two finger tap
- Install adobe creative cloud
- Swtich to Default Key Layout

# Linux manual setup items to automate
- Disable alt: http://ubuntuforums.org/showthread.php?t=1735533