ARG FEDORA_MAJOR_VERSION=39

FROM quay.io/fedora/fedora-silverblue:${FEDORA_MAJOR_VERSION}

RUN wget https://raw.githubusercontent.com/ValveSoftware/steam-devices/master/60-steam-input.rules -O /etc/udev/rules.d/60-steam-input.rules
RUN wget https://copr.fedorainfracloud.org/coprs/dannycolin/mozillavpn/repo/fedora-39/dannycolin-mozillavpn-fedora-39.repo -O /etc/yum.repos.d/dannycolin-mozillavpn-copr.repo

COPY etc /etc

RUN rpm-ostree override remove firefox firefox-langpacks gnome-classic-session gnome-session-xsession gnome-terminal gnome-terminal-nautilus gnome-tour \
gnome-shell-extension-apps-menu gnome-shell-extension-launch-new-instance gnome-shell-extension-places-menu gnome-shell-extension-window-list gnome-shell-extension-background-logo
RUN rpm-ostree install blackbox-terminal breeze-cursor-theme dash fira-code-fonts htop mozillavpn open-sans-fonts papirus-icon-theme rsms-inter-fonts zsh

COPY usr /usr

RUN sed -i '1 i #!/usr/bin/bash' /etc/grub.d/10_linux && sed -i '2d' /etc/grub.d/10_linux
RUN ln -sfT /usr/bin/dash /usr/bin/sh
RUN systemctl enable dconf-update.service
RUN rm -f /etc/yum.repos.d/fedora-cisco-openh264.repo
RUN rm -f /etc/yum.repos.d/dannycolin-mozillavpn-copr.repo

RUN ostree container commit
