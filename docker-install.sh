#!/bin/bash
sudo apt-get update && \
	sudo apt-get install -y --no-install-recommends apt-transport-https ca-certificates && \
	sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
	sudo sh -c 'echo deb https://apt.dockerproject.org/repo debian-jessie main >> /etc/apt/sources.list.d/docker.list' && \
	sudo apt-get update && \
	sudo apt-get install -y --no-install-recommends docker-engine
