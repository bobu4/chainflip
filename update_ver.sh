#!/usr/bin/env bash
cd ~/chainflip
rm chainflip.tar.gz
wget https://github.com/chainflip-io/chainflip-bin/releases/download/v0.2.3-soundcheck-soundcheck/chainflip.tar.gz
tar -xvf chainflip.tar.gz
mv chainflip-v0.2.3-soundcheck chainflip-v0.2.3
chmod -R +x chainflip-v0.2.3/*
cp -r chainflip-v0.2.2/config chainflip-v0.2.3/
systemctl stop chainflip-engine.service
systemctl stop chainflip-node.service
sed -i 's/v0.2.2/v0.2.3/g'  /etc/systemd/system/chainflip-engine.service 
sed -i 's/v0.2.2/v0.2.3/g'  /etc/systemd/system/chainflip-node.service
sed -i 's/v0.2.2/v0.2.3/g' /etc/logrotate.d/chainflip
systemctl daemon-reload
systemctl start chainflip-engine
systemctl start chainflip-node
