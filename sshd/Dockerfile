# Slurmctld image
FROM slurm_base

RUN apt-get update && \
    apt-get install -y openssh-server && \
    ssh-keygen -A && \
    curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl

COPY app/ /

RUN mkdir /var/run/sshd && \
    echo 'root:root' | chpasswd
