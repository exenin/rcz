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