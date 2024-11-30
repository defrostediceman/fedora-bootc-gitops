FROM quay.io/fedora/fedora-bootc:41

#include unit files and containers
ADD etc etc
#ADD usr usr

# third party software
RUN dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

#add additional software
RUN dnf install -y cockpit cockpit-podman cockpit-storaged qemu-kvm cockpit-machines cockpit-ws git neovim bash-completion && dnf clean all

#enable desired units
RUN systemctl enable fstrim.timer podman.socket podman-auto-update.timer cockpit.socket

