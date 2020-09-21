apt-get update -y
cd $HOME
apt-get install gcc git ncurses-dev make -y
# apt-get install silversearcher-ag 
# abandon silversearch, choose ripgre
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb
sudo dpkg -i ripgrep_11.0.2_amd64.deb
git clone --depth=1 https://github.com/vim/vim.git
cd vim/src
make
make install
cd ../..
basepath=$(cd `dirname $0`; pwd)
if [ -f "~/.vimrc" ]; then
	mv  ~/.vimrc ~/.vimrc.previous
fi
# install vimrc
ln -s $basepath/vimrc ~/.vimrc
# install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# curl https://nodejs.org/dist/v12.18.3/node-v12.18.3-linux-x64.tar.xz -o ~/node.tar.xz && xz -d ~/node.tar.xz && tar -xvf  ~/node.tar -C ~/ \
# 	&& ln -s ~/node-v12.18.3-linux-x64/bin/node /usr/local/bin && ln -s ~/node-v12.18.3-linux-x64/bin/npm /usr/local/bin && ln -s ~/node-v12.18.3-linux-x64/bin/npx /usr/local/bin
curl -sL install-node.now.sh/lts | bash

vim -c PlugInstall -c q -c q
