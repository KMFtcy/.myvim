apt-get update -y
basepath=`dirname $0`
cd $HOME
apt-get install gcc git ncurses-dev make python2-dev python3-dev -y
# apt-get install silversearcher-ag 
# abandon silversearch, choose ripgre
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb
sudo dpkg -i ripgrep_11.0.2_amd64.deb
echo | sudo add-apt-repository ppa:jonathonf/vim
sudo apt-get update -y
sudo apt-get install vim -y
if [ -f "~/.vimrc" ]; then
	mv  ~/.vimrc ~/.vimrc.previous
fi
# install vimrc
ln -s $basepath/vimrc ~/.vimrc
# install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

curl -sL install-node.now.sh/lts > install_nodejs.sh
yes | bash install_nodejs.sh
rm install_nodejs.sh

vim -c PlugInstall -c q -c q
