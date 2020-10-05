# env paramater
basepath=`dirname $0`
# move into work directory
cd $HOME
# download neccessary package and software
apt-get update -y
# basic dependency software
apt-get install gcc git ncurses-dev make python2-dev python3-dev -y
# install lazygit
sudo add-apt-repository ppa:lazygit-team/release
sudo apt-get update -y
sudo apt-get install lazygit -y
# ripgrep, supprt search feature
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb
sudo dpkg -i ripgrep_11.0.2_amd64.deb
# install the latest vim 
echo | sudo add-apt-repository ppa:jonathonf/vim
sudo apt-get update -y
sudo apt-get install vim -y
# replace old vimrc
if [ -f "~/.vimrc" ]; then
	mv  ~/.vimrc ~/.vimrc.previous
fi
ln -s $basepath/vimrc ~/.vimrc
# install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# intall nodejs, coc-nvim dependency
curl -sL install-node.now.sh/lts > install_nodejs.sh
yes | bash install_nodejs.sh
rm install_nodejs.sh
# install vim plugins
vim -c PlugInstall -c q -c q
