ARG FEDORA_MAJOR_VERSION=37

FROM quay.io/fedora-ostree-desktops/silverblue:${FEDORA_MAJOR_VERSION}

COPY etc /etc

RUN wget https://raw.githubusercontent.com/ValveSoftware/steam-devices/master/60-steam-input.rules -O /etc/udev/rules.d/60-steam-input.rules
RUN wget https://copr.fedorainfracloud.org/coprs/lyessaadi/blackbox/repo/fedora-37/lyessaadi-blackbox-fedora-37.repo -O /etc/yum.repos.d/lyessaadi-blackbox.repo
RUN wget https://copr.fedorainfracloud.org/coprs/calcastor/gnome-patched/repo/fedora-37/calcastor-gnome-patched-fedora-37.repo -O /etc/yum.repos.d/calcastor-gnome-patched.repo

RUN rpm-ostree override replace --experimental --from repo=copr:copr.fedorainfracloud.org:calcastor:gnome-patched mutter
RUN rpm-ostree override remove firefox firefox-langpacks gnome-classic-session gnome-session-xsession gnome-software gnome-software-rpm-ostree gnome-terminal gnome-terminal-nautilus gnome-tour
RUN rpm-ostree install blackbox-terminal breeze-cursor-theme fira-code-fonts htop papirus-icon-theme rsms-inter-fonts zsh

RUN systemctl enable dconf-update.service
RUN rm -f /etc/yum.repos.d/calcastor-gnome-patched.repo
RUN rm -f /etc/yum.repos.d/fedora-cisco-openh264.repo
RUN rm -f /etc/yum.repos.d/lyessaadi-blackbox.repo

RUN ostree container commit
