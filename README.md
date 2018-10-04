# Docker DevOps Tools Docker Image

# Create the Docker Image

`docker build -t ubuntu:devops .`

# Tools

This docker container has installed the following tools

1. kubeless
2. kubectl
3. terraform
4. kops
5. helm
6. helmfile
7. aws cli
8. ansible

# Usage

## Run kubectl

```
[ slamba ] ☘   docker run --rm -v $HOME/.kube:/root/.kube ubuntu:devops kubectl get pods
[ slamba ] ☘   docker run --rm -v $HOME/.kube:/root/.kube ubuntu:devops kubeless function ls
[ slamba ] ☘   docker run --rm -v $HOME/.kube:/root/.kube ubuntu:devops kops get cluster
[ slamba ] ☘   docker run --rm -v $HOME/.kube:/root/.kube ubuntu:devops helm install stable/nginx
[ slamba ] ☘   docker run --rm -v $HOME/.aws:/root/.aws ubuntu:devops aws ec2 describe-instances
[ slamba ] ☘   docker run --rm -v $HOME/.aws:/root/.aws -v /etc/ansible:/etc/ansible ubuntu:devops ansible
```

# Aliases

Add this to your $HOME/.bashrc:

```
for app in kubeless aws kubectl kops helm tiller helmfile; do
  alias ${app}="docker run --rm -v $HOME/.aws:/root/.aws -v $HOME/.kube:/root/.kube ubuntu:devops ${app}"
done
```
