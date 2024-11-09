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

function 1pass_signin(){
	eval $(op signin -f ) 
}
function set_ai_env_keys() {
	1pass_signin
	export ANTHROPIC_API_KEY=$(op read op://Personal/anthropic-claude-api-personal/credential)
	export OPENAI_API_KEY=$(op read op://Personal/openai/credential)
	export GEMINI_API_KEY=$(op read op://Personal/APIGOOGLEGeminiAPICredential/credential)
}
