#!/bin/sh

CODE_DIR=$HOME/POS
#PRD_DIR=$HOME/POS/prd

GIT_DIR=POSRetailer-Local
#1. Create codebase dir
if [ ! -d $CODE_DIR ] 
then
	echo "dir structure not present. creating $CODE_DIR"
	mkdir -p $CODE_DIR
fi


#########
# 2. Create actual prd dir
if [ ! -d $PRD_DIR ] 
then
	echo "dir structure not present. creating $PRD_DIR"
	mkdir -p $PRD_DIR
fi
##########


cd $CODE_DIR

if [ -d $CODE_DIR/$GIT_DIR ] 
then
	echo "Removing exisiting GIT dir $GIT_DIR"
	rm -r -f $GIT_DIR
fi

echo 'Cloning Repository from GIT for first time.'
git clone https://github.com/Chetan36/POSRetailer-Local.git




#Installation Process

#4. check if mvn present else install
node -v
rc=$?
if [ $rc != 0 ] # Not Present
then 
	echo "Node not present. Installing Node ..."
	sudo apt-get install nodejs
fi

#i
pm2 -v
rc=$?
if [ $rc != 0 ] # Not Present
then 
	echo "PM2 not present. Installing PM2 ..."
	sudo npm install -g pm2
fi

#ii.. go to POSRetailer-Local folder
cd $CODE_DIR/$GIT_DIR||exit

#iv stop and
pm2 stop all && pm2 delete all

#iii
npm install
#iv start server
pm2 start posRetailer.js


# ii. Properties file if any
cp start.html $HOME/Desktop/WareHouse.html

#remove git dir
#cd $CODE_DIR
#sudo rm -r -f *
exit




