#!/bin/sh
POS_HOME=$HOME/POS
GIT_DIR=Controller

#1.go to control folder
if [ ! -d $POS_HOME ]
then
	mkdir -p $POS_HOME
fi

cd $POS_HOME

if [ -d $POS_HOME/$GIT_DIR ] 
then
	echo 'Fetching updated from GIT'
	cd $POS_HOME/$GIT_DIR
	git pull
else 
	echo 'Cloning Repository from GIT for first time.'
	git clone https://github.com/Sarbe/Controller.git
fi

rc=$?
if [ $rc != 0 ]
then	
	echo "Please check internet connection"
	exit
fi
#3.. go to Rxdfert folder
cd $POS_HOME/$GIT_DIR||exit
sh -x main.sh
exit
