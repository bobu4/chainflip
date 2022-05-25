#!/bin/bash
cd ~/chainflip
rm chainflip.tar.gz
wget https://github.com/chainflip-io/chainflip-bin/releases/download/v0.2.6-soundcheck/chainflip.tar.gz
tar -xvf chainflip.tar.gz
chmod -R +x chainflip-v0.2.6/*
cp -r chainflip-v0.2.0/config chainflip-v0.2.5/
systemctl stop chainflip-engine.service
systemctl stop chainflip-node.service
sed -i 's/v0.2.5/v0.2.6/g'  /etc/systemd/system/chainflip-engine.service 
sed -i 's/v0.2.5/v0.2.6/g'  /etc/systemd/system/chainflip-node.service
sed -i 's/v0.2.5/v0.2.6/g' /etc/logrotate.d/chainflip
systemctl daemon-reload
systemctl start chainflip-engine
systemctl start chainflip-node
