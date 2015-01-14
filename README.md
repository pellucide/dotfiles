# Installation
Run the following in Terminal on a new OS X machine:
```
curl danielsuo.com/boot > boot && chmod +x boot | sh ./boot
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
- caps lock / key remapping
- cancel gestures
