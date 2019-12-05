#!/bin/bash

key=`openssl rand -base64 32`

gcloud compute instances create  \
    --machine-type f1-micro  \
    --zone=europe-west1-c \
    --metadata=p=$key \
    --metadata-from-file  \
        startup-script=master-startup.sh  \
    --scopes=https://www.googleapis.com/auth/cloud-platform \
    --tags=http-server,https-server \
    master
