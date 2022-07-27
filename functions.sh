#!/bin/bash

#
# NOtE
# Please try keep function alphabetically ordered tanx

function rczsetup(){
	kubetools
}
function rczupdate(){
  cd ~/.rcz; git pull
}

function downloadtf(){
    v=$1
    wget https://releases.hashicorp.com/terraform/$v/terraform_${v}_linux_amd64.zip -O /tmp/tf${v}.zip
    cd $v || mkdir $v && cd $v
    unzip /tmp/tf${v}.zip


}
function tvm(){
	ls -las ~/.tvm || mkdir ~/.tvm
	cd ~/.tvm
	v=$1
	ls ~/.tvm/$v/terraform || downloadtf $v
 	sudo rm /usr/local/bin/terraform
        sudo ln -s ~/.tvm/$v/terraform /usr/local/bin/terraform
}
