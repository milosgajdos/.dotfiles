setup:
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	mkdir -p ~/.vim/{colors,backup,swap,undo} && \
		wget https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim -O ~/.vim/colors/molokai.vim
	ln -s ~/.dotfiles/vimrc ~/.vimrc
	ln -s ~/.dotfiles/.bash_profile ~/.bash_profile
	ln -s ~/.dotfiles/.bash ~/.bash
	ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
	ln -s ~/.dotfiles/.s3cfg ~/.s3cfg
	ln -s ~/.dotfiles/.gemrc ~/.gemrc
	vim +PluginInstall +qall
