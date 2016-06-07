export PATH=$NVM_DIR/v$NODE_VERSION/bin:$PATH
export PATH=/usr/local/cuda-7.5/bin:$PATH
export PATH=/usr/local/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda-7.5/lib64:$LD_LIBRARY_PATH

export NVM_DIR="/Users/danielsuo/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

#TORCS
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib/torcs:/usr/local/share/games/torcs
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
export TORCS_BASE="/home/danielsuo/Desktop/DeepDriving/torcs-1.3.6"
export MAKE_DEFAULT=$TORCS_BASE/Make-default.mk
