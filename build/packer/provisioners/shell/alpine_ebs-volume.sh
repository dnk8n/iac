#!/bin/bash -eux
AWS_TAR='amazon.apkovl.tar.gz'
mv /tmp/grub.conf target/boot/grub/grub.conf
ln -sf target/boot/grub/grub.conf target/boot/grub/menu.lst

# Steps to create the amazon.apkovl.tar.gz* files -> https://gist.github.com/kennwhite/d89174749ce468f7c455
mv /tmp/${AWS_TAR}.b64 ${AWS_TAR}.b64
mv /tmp/${AWS_TAR}.md5.checksum ${AWS_TAR}.md5.checksum
cat ${AWS_TAR}.b64 | base64 -id  > ${AWS_TAR}
s1=$(cat ${AWS_TAR}.md5.checksum)
s2=$(md5sum ${AWS_TAR})
if [[ "$s1" == "$s2" ]]
then
    tar -xzvf ${AWS_TAR} -C target
else
	exit 1
fi
