#!/bin/bash

if [[ ! `whoami` = 'astral' ]]; then
  echo "Need to be logged as astral"
  exit 1
fi

#screen -S miner -dm bash -c "cd /home/astral/PROJETS/PhoenixMiner_3.5d_Linux ; ./start_miner.sh"

#screen -S miner -dm bash -c "cd /home/astral/PROJETS/ethminer-0.17.0-linux-x86_64 ; ./start_miner.sh"

#screen -S miner -dm bash -c "cd /home/astral/PROJETS/t-rex-0.19.9-linux-cuda10.0 ; ./start_miner.sh"

screen -S miner -dm bash -c "cd /home/astral/PROJETS/ethminer-0.18.0-cuda-9 ; ./start_miner.sh >/var/log/ethminer/ethminer.log 2>/var/log/ethminer/ethminer.stderr"
