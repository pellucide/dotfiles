# First install MATLAB

version=R2014a

sudo ln -s /Applications/MATLAB_$version.app/bin/matlab /usr/bin/matlab
duti -s com.mathworks.matlab .m all

echo "path('~/dotfiles/apps/matlab', path)" >> ~/Documents/MATLAB/startup.m
echo "run('~/dotfiles/apps/matlab/startup.m')" >> ~/Documents/MATLAB/startup.m