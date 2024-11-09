#!/bin/sh

# aws config switcher
# author: btrd (https://github.com/btrd)

# set the root aws config storage folder
AWS_CONFIG_FOLDER="${HOME}/.aws.d"

# display the current config
function aws_config_current() {
echo "Current AWS config: $(aws --profile default sts get-caller-identity --query 'Account' --output text)"
  }

  # list all available config files
function aws_config_list() {
	    ls -1 "${AWS_CONFIG_FOLDER}/aws.*"
}

# switch to a new config file
function aws_config_switch() {
local profile="${1}"
[ -z "${profile}" ] && echo "No profile specified" && return 1
[ ! -d "${AWS_CONFIG_FOLDER}/aws.${profile}" ] && echo "Profile not found: ${profile}" && return 1
#   export AWS_PROFILE="${profile}"
[ -d ~/.aws ] && rm -rf ~/.aws
cp -Rv "${AWS_CONFIG_FOLDER}/aws.${profile}" $HOME/.aws/
aws_config_current
}

# main
aws_config_current
if [ "${1}" = "list" ]; then
aws_config_list
elif [ "${1}" = "switch" ]; then
aws_config_switch "${2}"
else
echo "Usage: $0 [list|switch <profile>]"
fi
		    
