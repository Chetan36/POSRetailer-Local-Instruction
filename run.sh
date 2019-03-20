#!/bin/sh
POS_HOME=$HOME/POS/scripts
GIT_DIR_INSTR=POSRetailer-Local-Instruction
#Controller

#1.go to control folder
if [ ! -d $POS_HOME ]
then
	mkdir -p $POS_HOME
fi

cd $POS_HOME

if [ -d $POS_HOME/$GIT_DIR_INSTR ] 
then
	echo 'Fetching updated from GIT'
	cd $POS_HOME/$GIT_DIR_INSTR
	git pull
else 
	echo 'Cloning Repository from GIT for first time.'
	git clone https://github.com/Chetan36/POSRetailer-Local-Instruction.git
fi

rc=$?
if [ $rc != 0 ]
then	
	echo "Please check internet connection"
	exit
fi
#3.. go to GIT_DIR_INSTR folder
cd $POS_HOME/$GIT_DIR_INSTR||exit
# Run control command
chmod 755 main.sh
sh -x main.sh

exit
