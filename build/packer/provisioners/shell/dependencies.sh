#!/usr/bin/env sh -eux
source /etc/os-release
echo http://dl-cdn.alpinelinux.org/alpine/v3.6/community >> /etc/apk/repositories
apk --no-cache update && apk --no-cache upgrade
apk --no-cache --update add virtualbox-guest-additions virtualbox-guest-modules-virthardened
rc-update add virtualbox-guest-additions
echo vboxsf >> /etc/modules
echo vboxguest >> /etc/modules
apk --no-cache --update add ansible ca-certificates openssl wget docker
update-ca-certificates
rc-update add docker boot
wget https://releases.hashicorp.com/packer/1.1.1/packer_1.1.1_linux_amd64.zip; unzip packer_1.1.1_linux_amd64.zip -d /usr/local/bin; rm packer_1.1.1_linux_amd64.zip
addgroup -g 1000 -S user
adduser -u 1000 -D -S -G user user
addgroup user docker
dd if=/dev/zero of=/EMPTY bs=1M || true
rm -f /EMPTY
sync
