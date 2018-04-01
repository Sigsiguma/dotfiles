#!/bin/bash

set -e
OSTYPE="$(uname -s)"
DOT_DIRECTORY="${HOME}/dotfiles"
REMOTE_URL="git@github.com:Sigsiguma/dotfiles.git"

has() {
	type "$1" > /dev/null 2>&1
}

if [ ! -d ${DOT_DIRECTORY} ]; then
	echo "Downloading dotfiles..."
	mkdir ${DOT_DIRECTORY}

	if has "git"; then
		git clone --recursive "${REMOTE_URL}" "${DOT_DIRECTORY}"
	else
		echo "Please install git!"
		exit 1
	fi
	echo "Download dotfiles complete!"
fi

cd ${DOT_DIRECTORY}

source ./lib/brew

link_files() {
	for f in .??*
	do
		# please add ignorefiles
		[[ "$f" == ".git" ]] && continue
		[[ "$f" == ".DS_Store" ]] && continue

		ln -snfv ${DOT_DIRECTORY}/${f} ${HOME}/${f}
	done

	# neovim link
	if [ ! -e ~/.config ]; then
		mkdir ~/.config
	fi
	if [ ! -e ~/.config/nvim ]; then
		mkdir ~/.config/nvim
	fi

	ln -snfv ~/.vim ~/.config/nvim/
	ln -snfv ~/.vimrc ~/.config/nvim/init.vim

	echo "Deploy dotfiles complete!"
}

initialize() {
	case ${OSTYPE} in
		Darwin*)
			run_brew

            if [ ! -e ~/Library/Fonts/RictyDiminished-Regular.ttf ]; then
                wget https://github.com/mzyy94/RictyDiminished-for-Powerline/archive/3.2.4-powerline.zip
                unzip 3.2.4-powerline.zip
                cp -f RictyDiminished-for-Powerline-3.2.4-powerline/Ricty*.ttf ${HOME}/Library/Fonts/
                rm -rf RictyDiminished-for-Powerline-3.2.4-powerline*
                rm -rf 3.2.4-powerline.zip
            fi
			;;
		*)
			echo "Not compatible... sorry..."
			;;
	esac

	[ ${SHELL} != "/bin/zsh"  ] && chsh -s /bin/zsh

	if [ ! -d ${HOME}/.anyenv ]; then
		git clone https://github.com/riywo/anyenv ~/.anyenv
		anyenv install pyenv
		anyenv install rbenv
		exec $SHELL -l
	fi

	[ ! -d ${HOME}/.zplug ] && curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh

	echo "Initialize complete!"
}

command=$1

case $command in
	deploy)
		link_files
		;;
	init*)
		initialize
		;;
	*)
		echo "Plase command init or deploy"
		;;
esac

exit 0
