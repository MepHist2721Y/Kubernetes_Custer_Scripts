#!/bin/bash

helm add repo nvdp https://nvidia.github.io/k8s-device-plugin
helm add repo nvgfd https://nvidia.github.io/gpu-feature-discovery

helm repo update

helm install --version=0.9.0 --generate-name --set compatWithCPUManager=true --set migStrategy=mixed nvdp/nvidia-device-plugin
helm install --version=0.4.1 --set migStrategy=mixed gpu-feature-discovery nvgfd/gpu-feature-discovery
