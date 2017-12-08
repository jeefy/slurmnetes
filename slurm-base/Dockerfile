# Slurm Base image
FROM ubuntu:xenial

ENV SLURM_VER=17.11.0
ENV CONSUL_VER=1.0.1
ENV CONSUL_T_VER=0.19.4
ENV LD_LIBRARY_PATH=/usr/local/lib/
ENV SLURM_CONF=/etc/slurm-llnl/slurm.conf

RUN apt-get update -y && \
    apt-get install -y curl wget bzip2 make gcc munge libmunge2 libmunge-dev lua5.3 liblua5.3-dev supervisor \
                            unzip openmpi-bin openmpi-common python-pip libfreetype6-dev libpng12-dev gcc g++ \
                            graphviz-dev vim

RUN wget https://releases.hashicorp.com/consul/${CONSUL_VER}/consul_${CONSUL_VER}_linux_amd64.zip && \
    unzip consul_${CONSUL_VER}_linux_amd64.zip && \
    rm consul_${CONSUL_VER}_linux_amd64.zip && \
    mv consul /usr/bin/ && \
    wget https://releases.hashicorp.com/consul-template/${CONSUL_T_VER}/consul-template_${CONSUL_T_VER}_linux_amd64.zip && \
    unzip consul-template_${CONSUL_T_VER}_linux_amd64.zip && \
    rm consul-template_${CONSUL_T_VER}_linux_amd64.zip && \
    mv consul-template /usr/bin/


#RUN apt-get install -y  slurm-wlm && \
RUN  pip install clustershell networkx matplotlib pygraphviz

RUN curl -fsL https://download.schedmd.com/slurm/slurm-${SLURM_VER}.tar.bz2 | tar xfj - -C /opt/ && \
    cd /opt/slurm-${SLURM_VER}/ && \
    ./configure && make && make install

RUN useradd -u 2001 -d /home/slurm slurm && \
    mkdir -p /var/spool/slurmctld && \
    chown -R slurm /var/spool/slurmctld && \
    chmod -R 0755 /var/spool/slurmctld

COPY app/ /

RUN chmod 600 /etc/munge/munge.key && \
    mkdir /var/run/munge && \
    chown root: /var/log/munge/ /var/lib/munge /etc/munge /var/run/munge

CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]
