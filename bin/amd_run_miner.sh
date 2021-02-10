#!/bin/bash

if [[ `whoami` = 'root' ]]; then
  echo "Need to be logged as standard user not root"
  exit 1
fi

#screen -S miner -dm bash -c "cd /home/astral/PROJETS/PhoenixMiner_3.5d_Linux ; ./start_miner.sh >/var/log/miner/miner.log 2>/var/log/miner/miner.stderr"

screen -S miner -dm bash -c "cd /home/astral/PROJETS/teamredminer-v0.8.0-linux/ ; ./start_miner.sh >/var/log/miner/miner.log 2>/var/log/miner/miner.stderr"

#screen -S miner -dm bash -c "cd /home/astral/PROJETS/ethminer-0.18.0-cuda-9/ ; ./start_miner.sh >/var/log/miner/miner.log 2>/var/log/miner/miner.stderr"
