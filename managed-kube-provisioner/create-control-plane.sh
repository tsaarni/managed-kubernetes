#!/bin/sh



kubeadm alpha phase certs all --cert-dir /tmp/foo --apiserver-advertise-address 1.1.1.1
kubectl create secret generic etcd-certs --from-file=/tmp/foo/etcd/


kubeadm alpha phase kubeconfig all
      --apiserver-advertise-address string   The IP address the API server is accessible on
      --apiserver-bind-port int32

kubeadm alpha phase kubeconfig all --cert-dir /tmp/foo --kubeconfig-dir /tmp/ja


kubeadm
