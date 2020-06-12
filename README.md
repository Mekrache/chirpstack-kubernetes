# Chirpstack kubernetes
This repository contains a skeleton to deploy the [ChirpStack](https://www.chirpstack.io/) open-source LoRaWAN Network Server stack on a [kubernetes](https://kubernetes.io/) cluster.

**Note**: We used this docker-compose.yml file as a starting point for testing but keep in mind that for production usage it might need modifications. then we created kubernetes configurations files using [kompose](https://github.com/kubernetes/kompose), after that we've done some modifications on these files

## Directory layout
- `config-maps` : directory containing kubernetes config-maps which are used to configure the ChirpStack Network Server stack
- `deployments` : directory containing kubernetes deployements files 
- `services` : directory containig kubernetes services files
- `volumes` : directory containing the PersistentVolumeClaim files for postgresql and redis databases 
- `deploy.sh` : script to deploy the Chirpstack Netwrok Server stack on kubernetes using the default namespace
- `docker-compose.yml` : the docker-compose file containing the services which we used to create kubernetes config files
