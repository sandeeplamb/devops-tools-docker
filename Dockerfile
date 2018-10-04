FROM          ubuntu:latest
MAINTAINER    sandeeplamb@gmail.com

RUN apt-get -y update && \
    apt-get -y install python python-pip tar curl wget unzip gzip gnupg && \
    apt-get install -y apt-transport-https && \
    curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg |  apt-key add - && \
    echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list && \
    apt-get update -y && \
    apt-get install -y kubectl && \
    pip2 install --upgrade pip && pip install awscli boto3 ansible && \
    wget https://github.com/kubernetes/kops/releases/download/1.10.0/kops-linux-amd64 -O kops-linux-amd64 -o /dev/null && \
    wget https://releases.hashicorp.com/terraform/0.11.8/terraform_0.11.8_linux_amd64.zip -O terraform_0.11.8_linux_amd64.zip -o /dev/null && \
    wget https://storage.googleapis.com/kubernetes-helm/helm-v2.11.0-linux-amd64.tar.gz -O helm-v2.11.0-linux-amd64.tar.gz -o /dev/null && \
    wget https://github.com/kubeless/kubeless/releases/download/v1.0.0-alpha.8/kubeless_linux-amd64.zip -O kubeless_linux-amd64.zip -o /dev/null && \
    wget https://github.com/roboll/helmfile/releases/download/v0.40.1/helmfile_linux_amd64 -O /usr/bin/helmfile -o /dev/null && \
    ls -l && tar zxvf helm-v2.11.0-linux-amd64.tar.gz && \
    cp linux-amd64/helm linux-amd64/tiller /usr/bin && \
    unzip terraform_0.11.8_linux_amd64.zip -d /usr/bin && \
    unzip kubeless_linux-amd64.zip && \
    cp bundles/kubeless_linux-amd64/kubeless /usr/bin/kubeless && \
    mv kops-linux-amd64 /usr/bin/kops && \
    chmod 755 /usr/bin/kops /usr/bin/terraform /usr/bin/helm /usr/bin/tiller /usr/bin/kubeless /usr/bin/helmfile && \
    rm -rf /var/cache/* *.zip *.gz /linux-amd64 /root/.cache

CMD ["/bin/bash"]
