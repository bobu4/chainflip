#!/usr/bin/env bash
systemctl stop chainflip-engine.service
systemctl stop chainflip-node.service
sed -i 's/v'"$1"'/'"$2"'/g'  /etc/systemd/system/chainflip-engine.service 
sed -i 's/v'"$1"'/v'"$2"'/g'  /etc/systemd/system/chainflip-node.service
sed -i 's/v'"$2"'/v'"$2"'/g' /etc/logrotate.d/chainflip
systemctl daemon-reload
systemctl start chainflip-engine
systemctl start chainflip-node
