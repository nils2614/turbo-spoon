ARG FEDORA_MAJOR_VERSION=37

FROM quay.io/fedora-ostree-desktops/silverblue:37

RUN rpm-ostree override remove firefox firefox-langpacks gnome-software gnome-software-rpm-ostree
RUN rpm-ostree install zsh
RUN ostree container commit
