#!/bin/bash
# Deploy on the VPS: ssh root@<vps> 'bash /root/web/nyt-today/deploy/deploy.sh'
set -euo pipefail

# mise lives here and is only on PATH for an interactive root shell.
export PATH=/root/.local/bin:$PATH

cd /root/web/nyt-today

echo "Pulling latest changes..."
git pull --ff-only

echo "Installing tools..."
mise trust --quiet .
mise install

echo "Updating service file..."
ln -sf /root/web/nyt-today/deploy/nyt-today.service /etc/systemd/system/nyt-today.service
systemctl daemon-reload
systemctl enable --quiet nyt-today.service

echo "Restarting app..."
systemctl restart nyt-today.service
systemctl --no-pager --lines=0 status nyt-today.service
