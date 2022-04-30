function setupohymzsh(){
sudo apt install -y zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

function rczsetup(){
        mkdir -p ~/.rczconf/bin/
        kubetools
	setupohmyzsh
        installpygluukue
	installhomebnrew

}



function installpygluukue(){
        curl -L https://github.com/GluuFederation/cloud-native-edition/releases/download/v1.6.18/pygluu-kubernetes-linux-amd64.pyz > ~/.rczconf/bin/pygluu-kubernetes
        sudo ln -s  ~/.rczconf/bin/pygluu-kubernetes /usr/local/bin/pygluu-kubernetes && sudo chmod +x /usr/local/bin/pygluu-kubernetes
}

function installhomebrew(){
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}
