# my_nomad_cluster

Conf-as-code of a Nomad Cluster

## User Interface

### Consul

<master_ip>:8500

### Nomad

<master_ip>:4646

### Fabio

<client_ip>:9998

### Prometheus

<client_ip>:9999

### AlertManager

<client_ip>:9999/alertmanager

## How to create the cluster

### Infrastructure

It creates the VMs on Scaleway.

Copy `env_template` to `.env` file and file the variables.

Then, in the directory `infrastructure`, launch:
- `source .env && terraform init`
- `source .env && terraform plan`
- `source .env && terraform apply`

### Provisioning

It deploys Consul and Nomad on the VMs.

In the directory `provisioning`, launch : `source version.sh && ./provisioning.sh`

### Deployment

In the directory `deployment`, launch `./deploy.sh`
