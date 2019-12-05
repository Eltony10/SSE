ip=`curl -s -H "Metadata-Flavor: Google"  \
 "http://metadata.google.internal/computeMetadata/v1/instance/network-interfaces/0/access-configs/0/external-ip"`

key=`curl -s -H "Metadata-Flavor: Google"  \
  "http://metadata.google.internal/computeMetadata/v1/instance/attributes/p"`

#creates the clients 
for i in `seq 1 $1`
    do
	    gcloud compute instances create  \
          --machine-type=n1-standard-1 \
          --zone=europe-west1-c \
          --metadata=p=$key,ip=$ip \
          --metadata-from-file  \
             startup-script=client-startup.sh  \
          --scopes=https://www.googleapis.com/auth/cloud-platform\
          vm$i
    done
