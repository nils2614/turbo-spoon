# Fedora image: turbo-spoon
A custom image based on Fedora Silverblue, designed for my personal use case. \
Feel free to give it a try though :)
 
To pull this image use:
 
`sudo rpm-ostree rebase ostree-unverified-registry:ghcr.io/nils2614/turbo-spoon:37`
 
Heavily inspired by [uBlue](https://github.com/ublue-os/base).

## Verification

These images are signed with sisgstore's [cosign](https://docs.sigstore.dev/cosign/overview/). You can verify the signature by downloading the `cosign.pub` key from this repo and running the following command:

`cosign verify --key cosign.pub ghcr.io/nils2614/turbo-spoon:37`
