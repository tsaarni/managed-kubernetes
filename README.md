
# Work-in-progress

The project is an experiment on how one could provide shared control plane for launching on-demand Kubernetes clusters



## Create test-environment

    terraform init
    terraform apply -auto-approve
    ansible-playbook site.yml

    export KUBECONFIG=$PWD/admin.conf

    kubectl create -f https://raw.githubusercontent.com/rook/rook/master/cluster/examples/kubernetes/rook-operator.yaml
    kubectl create -f https://raw.githubusercontent.com/rook/rook/master/cluster/examples/kubernetes/rook-cluster.yaml
    kubectl create -f https://raw.githubusercontent.com/rook/rook/master/cluster/examples/kubernetes/rook-storageclass.yaml
    kubectl patch storageclass rook-block -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'


    kubectl apply -f https://raw.githubusercontent.com/containous/traefik/master/examples/k8s/traefik-rbac.yaml
    kubectl apply -f https://raw.githubusercontent.com/containous/traefik/master/examples/k8s/traefik-ds.yaml


## Destroy test-environment

    terraform destroy -force




## Build

    docker build -t tsaarni/managed-kube-provisioner:0.0.1 managed-kube-provisioner/
    docker push tsaarni/managed-kube-provisioner:0.0.1
