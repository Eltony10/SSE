#!/bin/bash
key=`curl -s -H "Metadata-Flavor: Google"  \
        "http://metadata.google.internal/computeMetadata/v1/instance/attributes/p"`

sudo curl -sL https://deb.nodesource.com/setup_12.x | bash - 
sudo apt-get install -y git nodejs
    cd
    git clone https://github.com/Eltony10/SSE
    cd
    git clone https://github.com/portsoc/distributed-master-worker
    cd distributed-master-worker
    npm install
    sudo npm run server $key

wait
for i in `seq 1 $1`
    do
	gcloud compute instances delete vm$i --delete-disks=all --zone=europe-west1-c
    done
