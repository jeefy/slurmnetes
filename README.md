# Slurmnetes
A project to apply a traditional implementation of Slurm on Kubernetes (with some magic)

This project is a decent template and starting path to run HPC clusters on Kubernetes.

## Dependencies
- minikube (local)
- kubectl
- helm

## Zero to Submitting a job (locally)
- `git clone https://github.com/jeefy/slurmnetes`
- `cd slurmnetes && ./start.sh`
- Grab coffee / wait.
- `kubectl get pods` -- Look for slurmctld-xxxxxxxxx-xxxxxx, copy that string
- `kubectl exec -ti slurmctld-xxxxxxxxx-xxxxxx bash`
- `sinfo` or `srun` or `sbatch` at your leisure

## Scaling
Currently scaling is done by updating `slurmd-deployment.yaml` and running `kubectl apply -f infrastructure/slurmd-deployment.yaml`

## Logging and metrics

`minikube service grafana-logging -n kube-system`

`minikube service kibana-logging -n kube-system`
