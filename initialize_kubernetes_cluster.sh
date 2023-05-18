#!/bin/bash

swapoff -a
kubeadm init --apiserver-advertise-address=10.100.100.37 >> ./ClusterInitLog.txt
kubeadm token create --print-join-command >> ./JoinNodeCommand.txt
export KUBECONFIG=/etc/kubernetes/admin.conf

kubectl apply -f https://docs.projectcalico.org/v3.11/manifests/calico.yaml

curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3

chmod 700 get_helm.sh

./get_helm.sh

