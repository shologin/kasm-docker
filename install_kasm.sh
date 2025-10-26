#!/bin/bash
set -e
set -u  # fail on unset variables
set -o pipefail
set -o xtrace  # optional: prints each command before running

exec > >(tee -a /var/log/kasm_startup.log) 2>&1

FLAG_FILE=/opt/kasm/.installed

if [ ! -f "$FLAG_FILE" ]; then
  echo "===== Enabling Docker ====="
  systemctl enable docker
  systemctl start docker

  echo "===== Downloading Kasm ====="
  mkdir -p /opt/kasm
  cd /opt/kasm
  curl -fsSL -O https://kasm-static-content.s3.amazonaws.com/kasm_release_1.17.0.7f020d.tar.gz
  tar -xf kasm_release_1.17.0.7f020d.tar.gz 
  rm -rf kasm_release_1.17.0.7f020d.tar.gz
  chmod +x /opt/kasm/kasm_release/install.sh

  echo "===== Running installation script ====="
  yes | bash /opt/kasm/kasm_release/install.sh

  echo "===== Creating flag file ====="
  touch $FLAG_FILE
else
  echo "===== Already set up ====="
fi

echo "===== Install kasm script DONE ====="
