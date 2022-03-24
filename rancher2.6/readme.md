# Rancher 2.6 com RKE2/Helm

Com 3 servidores: Master + 2 Nós.

## SERVIDOR MASTER


- Primeiro SCRIPT
```
#!/bin/bash

sudo apt-get install curl -y

# Swap Off
sudo swapoff -a
sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab

# Helm Install on Debian based distributions
curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -
sudo apt-get install apt-transport-https --yes
echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update
sudo apt-get install helm

# kubectl install on Debian based distributions
sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt update
sudo apt install -y kubectl

exit 127
```

Depois digite no terminal
```
export KUBECONFIG=/etc/rancher/rke2/rke2.yaml PATH=$PATH:/var/lib/rancher/rke2/bin
```

- Segundo Script


```
#!/bin/bash

# Run the installer
curl -sfL https://get.rke2.io | sh - #
  # Se o comando acima der erro ..faca 
  sudo curl -sfL https://get.rke2.io | sudo sh -



# Enable the rke2-server service
sudo systemctl enable rke2-server.service
# Start the service
sudo systemctl start rke2-server.service

exit 127
```
Verificar o STATUS do SERVICO rke2-server.service
```
sudo systemctl status rke2-server.service
```

Verificar a TOKEN do RANCHER SERVER. Voce vai precisar para adicionar no WOKER ( pod / ou nó )

```
sudo cat  /var/lib/rancher/rke2/server/node-token

```


## SERVIDOR NÓ (WORKER)

```
#!/bin/bash
# rke2 - (Worker) Node Installation

# Variables, DO NO~T FORGET TO FILL IT
SERVER_IP="192.168.1.60"
TOKEN="K10a3554734febf9640170918a013fb5176c95868de741e6b37df1bf7ab5d66f6fe::server:c364def31225fd1af2331bf7a461e932"

# Swap Off
sudo swapoff -a
sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab

# Run the installer
sudo curl -sfL https://get.rke2.io | INSTALL_RKE2_TYPE="agent" sudo sh -

# Enable the rke2-agent service
sudo systemctl enable rke2-agent.service

# Configure the rke2-agent service¶
sudo mkdir -p /etc/rancher/rke2/
sudo echo "server: https://$SERVER_IP:9345" | sudo tee /etc/rancher/rke2/config.yaml
echo "token: $TOKEN" \ >> /etc/rancher/rke2/config.yaml

# Start the service
systemctl start rke2-agent.service

exit 127
```
---------------------------

## VOLTE AO SERVIDOR MASTER

```
kubectl apply --validate=false -f https://github.com/jetstack/cert-manager/releases/download/v1.5.4/cert-manager.yaml

kubectl get deploy --all-namespaces
kubectl get po --all-namespaces

```
