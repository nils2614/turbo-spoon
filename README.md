# Fedora image: turbo-spoon
A custom image based on Fedora Silverblue, designed for my personal use case. \
Feel free to give it a try though. :)
 
To pull this image use:
 
`rpm-ostree rebase ostree-unverified-registry:ghcr.io/nils2614/turbo-spoon:40`
 
then reboot and use
 
`rpm-ostree rebase ostree-image-signed:docker://ghcr.io/nils2614/turbo-spoon:40`
 
Heavily inspired by [uBlue](https://github.com/ublue-os/base).

## Verification

These images are signed with sisgstore's [cosign](https://docs.sigstore.dev/cosign/overview/). You can verify the signature by downloading the `turbo-spoon.pub` key from this repo and running the following command:

`cosign verify --key turbo-spoon.pub ghcr.io/nils2614/turbo-spoon:40`
