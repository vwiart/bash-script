#!/bin/bash

for img in $(sudo docker images | grep none | awk -F ' ' '{print $3}')
do
	sudo docker rmi -f $img
done
