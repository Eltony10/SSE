key=`curl -s -H "Metadata-Flavor: Google"  \
        "http://metadata.google.internal/computeMetadata/v1/instance/attributes/p"`
ip=`curl -s -H "Metadata-Flavor: Google"  \
        "http://metadata.google.internal/computeMetadata/v1/instance/attributes/ip"`

sudo curl -sL https://deb.nodesource.com/setup_12.x | bash - 
sudo apt-get install -y git nodejs

    git clone https://github.com/portsoc/distributed-master-worker
    cd distributed-master-worker
    npm install
    sudo npm run client $key $ip
wait
sudo poweroff
