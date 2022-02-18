#!/usr/bin/env bash
cd ~/chainflip
rm chainflip.tar.gz
wget https://github.com/chainflip-io/chainflip-bin/releases/download/v0.2.2-soundcheck/chainflip.tar.gz
tar -xvf chainflip.tar.gz
chmod -R +x chainflip-v0.2.2/*
cp -r chainflip-v0.2.1/config chainflip-v0.2.2/
systemctl stop chainflip-engine.service
systemctl stop chainflip-node.service
sed -i 's/v0.2.1/v0.2.2/g'  /etc/systemd/system/chainflip-engine.service 
sed -i 's/v0.2.1/v0.2.2/g'  /etc/systemd/system/chainflip-node.service
sed -i 's/v0.2.1/v0.2.2/g' /etc/logrotate.d/chainflip
systemctl daemon-reload
systemctl start chainflip-engine
systemctl start chainflip-node
