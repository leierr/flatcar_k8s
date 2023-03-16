#!/usr/bin/bash
# check for internet connectivity
timeout 60 /usr/bin/bash -c "</dev/tcp/google.com/443" &> /dev/null || exit 1
# install cni plugins
CNI_PLUGINS_VERSION="v1.2.0"
CNI_ARCH="amd64"
mkdir -p /opt/cni/bin
/usr/bin/curl -L "https://github.com/containernetworking/plugins/releases/download/${CNI_PLUGINS_VERSION}/cni-plugins-linux-${CNI_ARCH}-${CNI_PLUGINS_VERSION}.tgz" | /usr/bin/tar -xzC /opt/cni/bin
# install crictl
CRICTL_VERSION="v1.26.0"
CRICTL_ARCH="amd64"
/usr/bin/curl -L "https://github.com/kubernetes-sigs/cri-tools/releases/download/${CRICTL_VERSION}/crictl-${CRICTL_VERSION}-linux-${CRICTL_ARCH}.tar.gz" | /usr/bin/tar -xzC /opt/bin
# install cilium cli
CILIUM_CLI_VERSION=$(curl -s https://raw.githubusercontent.com/cilium/cilium-cli/master/stable.txt)
CILIUM_CLI_ARCH=amd64
curl -L https://github.com/cilium/cilium-cli/releases/download/${CILIUM_CLI_VERSION}/cilium-linux-${CILIUM_CLI_ARCH}.tar.gz | /usr/bin/tar -xzC /opt/bin