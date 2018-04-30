#!/bin/sh

cd /home/pool/poolio &&
export NVM_DIR="/home/pool/.nvm" &&
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" &&
nvm use 8 &&
forever stop init.js &&
forever start init.js
