provider "vsphere" {
  vsphere_server       = var.vsphere_server
  user                 = var.vsphere_user
  password             = var.vsphere_password
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "vmware_datacenter" {
  name = var.datacenter_name
}

data "vsphere_compute_cluster" "management_cluster" {
  name = var.cluster_name
  datacenter_id = data.vsphere_datacenter.vmware_datacenter.id
}

data "vsphere_host_thumbprint" "thumbprint_esx1" {
  address = "esx1.vmware.local"
  insecure = true
}

data "vsphere_host_thumbprint" "thumbprint_esx2" {
  address = "esx2.vmware.local"
  insecure = true
}

#### Add Hosts to Cluster ####
resource vsphere_host "esxi01" {
  hostname = "esx1.vmware.local"
  username = "root"
  password = var.host_password
  #license = var.esxi_license
  thumbprint = data.vsphere_host_thumbprint.thumbprint_esx1.id
  cluster = data.vsphere_compute_cluster.management_cluster.id
}

resource vsphere_host "esxi02" {
  hostname = "esx2.vmware.local"
  username = "root"
  password = var.host_password
  #license = var.esxi_license
  thumbprint = data.vsphere_host_thumbprint.thumbprint_esx2.id
  cluster = data.vsphere_compute_cluster.management_cluster.id
}
