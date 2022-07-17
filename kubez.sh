#!/bin/bash

#
# NOtE
# Please try keep function alphabetically ordered tanx



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
		kubectl logs $pod | sed "s/^/$pod: > /g"
		echo '------------'
	done
}

function kctll(){
	for pod in $(kubectl get po | cut -d' ' -f1 | grep -v NAME ); do
		echo $pod
		kubectl logs $pod | sed "s/^/$pod: > /g" 
		echo '------------'
	done
}


function kctllf(){
	for pod in $(kubectl get po | cut -d' ' -f1 | grep -v NAME ); do
		echo $pod
		kubectl logs -f $pod | sed "s/^/$pod: > /g" &
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
	if [ ! $(argocd version | grep argocd) ]; then
		wget $argourl
       		sudo mv argocd-linux-amd64 /usr/local/bin/argocd; sudo chmod +x /usr/local/bin/argocd
	fi

	 brew install derailed/k9s/k9s

}

function rczupdate(){
  cd ~/.rcz; git pull
}

function kubemergeconfs(){
	echo "Kube Merge Configs"
	ls ~/.kube/configs.d || mkdir ~/.kube/configs.d  2>/dev/null
	run=$1
	if [[ "$run" ]]; then
   	    dr="$HOME/.kube/configs.d"; xdrpath="$HOME/.kube/config"; for i in $(ls $dr); do xdrpath="$xdrpath:$dr/$i"; done  ; echo $xdrpath
        KUBECONFIG=$xdrpath kubectl config view --flatten > /tmp/config
		mv /tmp/config ~/.kube/config
		rm kube/configs.d/*
	else;
	    echo "no run"
	
		echo "Put all kubeconfigs in ~/.kube/configs.d/ and rerun this command with approve:  $ kubemergeconfs approve " 
	fi
}