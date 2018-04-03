FROM alpine:3.7

RUN apk --no-cache add --virtual build-dependencies ca-certificates curl  && \
    curl -L --remote-name-all https://storage.googleapis.com/kubernetes-release/release/$(curl -sSL https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/{kubeadm,kubectl} && \
    chmod +x kubeadm kubectl && \
    mv kubeadm kubectl /usr/bin && \
    apk del build-dependencies
