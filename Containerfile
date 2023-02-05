ARG FEDORA_MAJOR_VERSION=37

FROM quay.io/fedora-ostree-desktops/silverblue:${FEDORA_MAJOR_VERSION}

RUN rm /etc/yum.repos.d/fedora-cisco-openh264.repo
RUN wget https://raw.githubusercontent.com/ValveSoftware/steam-devices/master/60-steam-input.rules -O /etc/udev/rules.d/60-steam-input.rules

RUN rpm-ostree override remove \
    firefox firefox-langpacks gnome-classic-session gnome-session-xsession gnome-software gnome-software-rpm-ostree
RUN rpm-ostree install \
    breeze-cursor-theme fira-code-fonts htop papirus-icon-theme rsms-inter-fonts zsh
    # edk2-ovmf qemu-audio-pa qemu-device-display-qxl qemu-device-display-virtio-gpu qemu-device-display-virtio-gpu-gl \
    # qemu-device-display-virtio-vga qemu-device-display-virtio-vga-gl qemu-img qemu-system-x86-core qemu-ui-gtk qemu-ui-opengl virglrenderer
    
RUN ostree container commit
