#!/bin/bash

function setupZSH() {
	wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
	chsh -s `which zsh`
}

setupZSH
