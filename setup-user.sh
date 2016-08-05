#!/bin/bash

function setupZSH() {
	wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
	chsh -s `which zsh`
	cp -R resources/.oh-my-zsh ~vwiart/
	cp -R resources/.zshrc ~vwiart/
	cp resources/honukai.zsh-theme ~vwiart/.oh-my-zsh/themes/honukai.zsh-theme
	source ~vwiart/.zshrc
}

setupZSH
