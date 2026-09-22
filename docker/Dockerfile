FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV container=docker

# Install systemd, python3 (for Ansible), and K3s prerequisites
RUN apt-get update && \
    apt-get install -y \
    systemd \
    systemd-sysv \
    python3 \
    curl \
    iptables \
    kmod \
    iproute2 \
    sudo && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Clean up unnecessary systemd services for a container environment
RUN cd /lib/systemd/system/sysinit.target.wants/ && \
    ls | grep -v systemd-tmpfiles-setup | xargs rm -f $1 && \
    rm -f /lib/systemd/system/multi-user.target.wants/* && \
    rm -f /etc/systemd/system/*.wants/* && \
    rm -f /lib/systemd/system/local-fs.target.wants/* && \
    rm -f /lib/systemd/system/sockets.target.wants/*udev* && \
    rm -f /lib/systemd/system/sockets.target.wants/*initctl* && \
    rm -f /lib/systemd/system/basic.target.wants/* && \
    rm -f /lib/systemd/system/anaconda.target.wants/*

# K3s volumes
VOLUME [ "/sys/fs/cgroup", "/var/lib/rancher/k3s" ]

CMD ["/lib/systemd/systemd"]
