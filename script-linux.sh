#!/bin/bash
useradd -m ansible
usermod --shell /bin/bash --home /home/ansible ansible
echo 'ansible:terraformTest123'|chpasswd
usermod -aG sudo ansible
sed -re 's/^(PasswordAuthentication)([[:space:]]+)no/\1\2yes/' -i.`date -I` /etc/ssh/sshd_config
service ssh restart
