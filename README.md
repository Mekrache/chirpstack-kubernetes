# Chirpstack kubernetes
This repository contains a skeleton to deploy the [ChirpStack](https://www.chirpstack.io/) open-source LoRaWAN Network Server stack on a [kubernetes](https://kubernetes.io/) cluster.

**Note**: We used this docker-compose.yml file as a starting point for testing but keep in mind that for production usage it might need modifications. then we created kubernetes configurations files using [kompose](https://github.com/kubernetes/kompose), after that we've done some modifications on these files.

## Directory layout
- `config-maps` : directory containing kubernetes config-maps which are used to configure the ChirpStack Network Server stack
- `deployments` : directory containing kubernetes deployements files 
- `services` : directory containig kubernetes services files
- `volumes` : directory containing the PersistentVolumeClaim files for [postgresql](https://www.postgresql.org/) and [redis](https://redis.io/) databases 
- `deploy.sh` : script to deploy the Chirpstack Netwrok Server stack on kubernetes using the default namespace
- `docker-compose.yml` : the docker-compose file containing the services which we used to create kubernetes config files with Kompose

## Data persistence
PostgreSQL and Redis data is persisted in kubernetes PersistentClaimVolumes, see the config files on the `volumes`
folder .

## Requirements
Before running this `deploy.sh` script file, make sure you have Kubernetes cluster installed

For users looking to test chirpstack-kubernetes , you can install [minikube](https://kubernetes.io/fr/docs/tasks/tools/install-minikube/) which runs a single-node Kubernetes cluster inside a Virtual Machine (VM) on your laptop

## Usage
To deploy and start the ChirpStack open-source LoRaWAN Network Server stack, simply run:
```bash
$ ./deploy.sh
```

you can always see the state of your pods :
```bash
$ watch kubectl get all 
```

After all the components have been initialized and started, you should be able
to open the Chirpstack Application Server web-interface in your browser


if you are using minikube, you can get the ip address and the port with the command :
```bash
$ minikube service chirpstack-application-server --url
```

if you are using minikube and you want to access the Chirpstack Application Server web-interface with https://localhost:8080 
you must configure the port forwarding on the minikube VM, below an example of the configuration :

| Name  | Protocol | Host IP | Host Port | Guest Ip | Guest Port |
| --- | --- | --- | --- | --- | --- |
| chirpstack-application-server  | TCP  | 0.0.0.0 | 8080 | @ip_minikube_VM | 30001 |
| chirpstack-gateway-bridge  | UDP  | 0.0.0.0 | 1700 | @ip_minikube_VM | 30002 |



### Add Network Server

When adding the Network Server in the ChirpStack Application Server web-interface
(see [Network Servers](https://www.chirpstack.io/application-server/use/network-servers/)),
you must enter `chirpstack-network-server:8000` as the Network Server `hostname:IP`.
