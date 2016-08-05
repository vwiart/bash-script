#!/bin/bash

function initsys() {
	apt-get update
	apt-get upgrade -y
	apt-get dist-upgrade -y
	apt-get clean
	apt-get autoremove
	apt-get install -y --no-install-recommends curl git apt-transport-https ca-certificates zsh sudo tmux
}

function setupUser() {
	useradd -ms /bin/zsh vwiart -g users -g ssh -g sudo
	git clone https://github.com/vwiart/bash-script.git /home/vwiart/bash-script
	chown vwiart:users -R /home/vwiart
	echo Choose vwiart password
	passwd vwiart
}

echo Choose root password
passwd
initsys
setupUser
