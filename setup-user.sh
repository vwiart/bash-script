#!/bin/bash
HOME=~vwiart

function setupGit() {
	git config --global user.email "vincent.wiart@gmail.com"
	git config --global user.name "vwiart"
	git config --global alias.grog 'log --graph --abbrev-commit --decorate --all --format=format:"%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(dim white) - %an%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n %C(white)%s%C(reset)"'
}

function setupZSH() {
	wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
	chsh -s `which zsh`
	cp -R resources/.oh-my-zsh $HOME/
	cp -R resources/.zshrc $HOME/
	cp resources/honukai.zsh-theme ~vwiart/.oh-my-zsh/themes/honukai.zsh-theme
	source ~vwiart/.zshrc
}

function setupSSH() {
	SSHDIR=$HOME/.ssh
	mkdir $SSHDIR
	touch $SSHDIR/authorized_keys
	touch $SSHDIR/id_rsa
	chmod 0600 $SSHDIR/id_rsa
	echo Update authorized_keys and id_rsa
}

setupGit
setupZSH
setupSSH
