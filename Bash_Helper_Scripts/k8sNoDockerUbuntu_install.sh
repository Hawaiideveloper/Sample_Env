#!/bin/bash




echo " please see my issue that explains this file's existence"
echo "https://github.com/Hawaiideveloper/Infastructure-as-Code-Sample_Env/issues/57"

echo "These scripts will prepare ubuntu to run Kubernetes"


#Get rid of swapping issues:
sudo swapoff -a 
sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab



# Disable IPV6 settings:

sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1
sudo sysctl -w net.ipv6.conf.default.disable_ipv6=1
sudo sysctl -w net.ipv6.conf.lo.disable_ipv6=1



#To install using script

minikube delete
sudo apt-get update -y
sudo apt-get upgrade -y

sudo apt-get install curl -y
sudo apt-get install apt-transport-https -y

echo "Now waiting 5 seconds"
sleep 5

echo "now agreeing to the VirtualBox license agreement"

sudo apt install virtualbox -y 
sudo apt install virtualbox-ext-pack -y
sudo apt-get install conntrack -y

# create a vm via command-line please see my issue titled "How to create / provision a virtual machine using CLI in Virtualbox" 
echo "more details located at  https://github.com/Hawaiideveloper/Infastructure-as-Code-Sample_Env/issues/58"

# This actually belongs to the main repo
#VBoxManage modifyvm name_of_your_ubuntu_vm --nested-hw-virt on

echo "provided you agreed to everything"
echo " you will now be redirected to minikube installation"

wget https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo cp minikube-linux-amd64 /usr/local/bin/minikube

sudo chmod 755 /usr/local/bin/minikube
minikube version

curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

# Use the below script to do debugging and view logs
#minikube start --alsologtostderr -v=7 to debug crashes

minikube config set driver virtualbox

# Default ommand start with virtualbox
# minikube start --driver=virtualbox


# Start Minikube and limit to 2 CPUs and 2 Gig of memory and 20GB of HDD space
minikube start --driver=virtualbox --cpus=2 --memory=2600 --disk-size=20g




kubectl version -o json

#minikube start

#kubectl config view
#kubectl cluster-info

#kubectl get nodes
#kubectl get pod

#minikube ssh

#exit


# Simply copy and then comments below and paste them as needed, into console
#minikube stop
#minikube status
#minikube delete
#minikube addons list
#minikube dashboard
#minikube dashboard --url



# If you want a dev box created using homebrew please see below
# the following lines are experimental and should not be used, and only used by experience personnel 


# To Install Homebrew uncomment next line:  (yes Linux has homebrew now)
#/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# To install minikube with homebrew uncomment the next line and do the following ....
# Do not uncomment for production sytems
