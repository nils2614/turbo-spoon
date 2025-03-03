# Fedora image: turbo-spoon
A custom image based on Fedora Silverblue, designed for my personal use case. \
Feel free to give it a try though. :)
 
To pull this image use:
 
`rpm-ostree rebase ostree-unverified-registry:ghcr.io/nils2614/turbo-spoon:42`
 
then reboot and use
 
`rpm-ostree rebase ostree-image-signed:docker://ghcr.io/nils2614/turbo-spoon:42`
 
Heavily inspired by [uBlue](https://github.com/ublue-os/base).

## Note
The source to buld this image is hosted on [Codeberg](https://codeberg.org/nils2614/turbo-spoon).
This repository exists to build and push the image to ghcr for now.

## Verification

These images are signed with sisgstore's [cosign](https://docs.sigstore.dev/cosign/overview/). You can verify the signature by downloading the `turbo-spoon.pub` key from this repo and running the following command:

`cosign verify --key turbo-spoon.pub ghcr.io/nils2614/turbo-spoon:42`
