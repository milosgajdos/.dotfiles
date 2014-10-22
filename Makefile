vimsetup:
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	mkdir -p ~/.vim/colors && \
		wget https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim -O ~/.vim/colors/molokai.vim
	ln -s ~/.dotfiles/vimrc ~/.vimrc
	vim +PluginInstall +qall
