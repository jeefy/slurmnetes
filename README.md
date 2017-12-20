# Slurmnetes
A project to apply a traditional implementation of Slurm on Kubernetes (with some magic)

This project is a decent template and starting path to run HPC clusters on Kubernetes.

While the focus of this is towards starting and testing locally, the Kubernetes files and the Docker containers can be deployed in a real cluster.

## Dependencies
- minikube (local)
- kubectl
- helm

## Zero to Submitting a job (locally)
- `git clone https://github.com/jeefy/slurmnetes`
- `cd slurmnetes && ./bin/start.sh` -- For OSX, Minikube auto-mounts /Users/* other OSs may vary. Where you put the repo needs to be accessible to minikube (pwd on host = pwd in minikube)
- Grab coffee / wait.
- `kubectl get pods` -- Look for slurmctld-xxxxxxxxx-xxxxxx, copy that string
- `kubectl exec -ti slurmctld-xxxxxxxxx-xxxxxx bash`
- `sinfo` or `srun` or `sbatch` at your leisure
- For ssh, run `minikube service sshd`, note the IP:Port that pops up
- Then run `ssh root@[IP] -p[PORT]` with a password of `root` (SSH is POC for now)

## Scaling
Currently scaling is done by updating `slurmd-deployment.yaml` and running `kubectl apply -f infrastructure/slurmd-deployment.yaml`

## Logging and metrics

`minikube service grafana-logging -n kube-system`

`minikube service kibana-logging -n kube-system`

## Roadmap (No particular order)
- Scratch
- Interface with Consul for Healthchecks
- sshd on the slurmctld container
- Scale slurmctld container?
- User accounts / IDM
- Home directories / Mounts
