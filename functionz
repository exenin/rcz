#!/bin/bash

#
# NOtE
# Please try keep function alphabetically ordered tanx

export VAGRANT_HOME="/opt/volumes/disk1/vagrant_home/"


function gcp-docker(){

  gcloud auth login     
  gcloud auth print-access-token | docker login -u oauth2accesstoken --password-stdin https://us.gcr.io

}

function kdserv() {
     s=$1;
     kctl get $s| cut -d' '  -f1|xargs kubectl delete $s
}

function kctll(){
	for pod in $(kubectl get po | cut -d' ' -f1 | grep -v NAME ); do
		echo $pod
		kubectl logs $pod
		echo '------------'
	done
}

function rczsetup(){
	kubetools
}
function kubetools(){
	echo 'install some stuff'
	# KREW
(
  set -x; cd "$(mktemp -d)" &&
  OS="$(uname | tr '[:upper:]' '[:lower:]')" &&
  ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')" &&
  KREW="krew-${OS}_${ARCH}" &&
  curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/${KREW}.tar.gz" &&
  tar zxvf "${KREW}.tar.gz" &&
  ./"${KREW}" install krew
)
	
        kubectl krew install ctx
	kubectl krew install ns
	sudo apt install fzf

	cd /tmp/; 
	argourl=https://github.com/argoproj/argo-cd/releases/download/v2.3.3/argocd-linux-amd64
	wget $argourl
	sudo mv argocd-linux-amd64 /usr/local/bin/argocd; sudo chmod +x /usr/local/bin/argocd

}

function rczupdate(){
  cd ~/.rcz; git pull
}
