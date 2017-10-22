#!/usr/bin/env sh -eux
mkdir -p /tmp/provisioners/ansible-local
mv /tmp/playbook.yml /tmp/provisioners/ansible-local/playbook.yml
/usr/local/bin/packer build /tmp/03_kaggle-python.json
dd if=/dev/zero of=/EMPTY bs=1M || true
rm -f /EMPTY
sync
