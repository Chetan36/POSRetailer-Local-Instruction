#!/bin/sh

CODE_DIR=$HOME/POS/code
PRD_DIR=$HOME/POS/prd

GIT_DIR=Rxdfert
#1. Create codebase dir
if [ ! -d $CODE_DIR ] 
then
	echo "dir structure not present. creating $CODE_DIR"
	mkdir -p $CODE_DIR
fi
# 2. Create actual prd dir
if [ ! -d $PRD_DIR ] 
then
	echo "dir structure not present. creating $PRD_DIR"
	mkdir -p $PRD_DIR
fi
###

cd $CODE_DIR

if [ -d $CODE_DIR/$GIT_DIR ] 
then
	echo "Removing exisiting GIT dir $GIT_DIR"
	rm -r -f $GIT_DIR
fi

echo 'Cloning Repository from GIT for first time.'
git clone https://github.com/Sarbe/Rxdfert.git

#3.. go to Rxdfert folder
cd $CODE_DIR/$GIT_DIR||exit

#4. check if mvn present else install
mvn --version
rc=$?
if [ $rc != 0 ] # Not Present
then 
	echo "maven not present. Installing maven ..."
	sudo apt-get install maven
fi

#5. Install any third party jar to maven repo
mvn install:install-file -Dfile=MyRobotoFont-1.0.jar -DgroupId=MyRobotoFont -DartifactId=MyRobotoFont -Dversion=1.0  -Dpackaging=jar  


mvn clean install
#6 copy required files
# i. Jar
cp target/*.jar $PRD_DIR/POS-Retailer.jar

# ii. Properties file if any
cp start.html $HOME/Desktop/WareHouse.html
#7. Database installation


# Last activity
#remove git dir
cd $CODE_DIR
sudo rm -r -f *
exit




