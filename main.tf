
provider "libvirt" {
  uri = "qemu:///system"
}

resource "libvirt_network" "kubernetes" {
  name      = "kubernetes"
  addresses = ["10.200.0.0/24"]
  bridge    = "kubernetes"
  autostart = "true"
}

module "master" {
  source = "cluster"
  num_nodes = 3
  memory = 4096
  name = "master"
  network_name = "kubernetes"
  ssh_public_key = "${var.ssh_public_key}"
}

output "hostnames" {
  value = "${module.master.hostnames}"
}

output "addresses" {
  value = "${module.master.addresses}"
}
