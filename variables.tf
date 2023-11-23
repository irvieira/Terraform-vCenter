# vCenter Credential Variables 
variable "vsphere_user" {} 
variable "vsphere_password" {} 
variable "vsphere_server" {default = "vcsa.vmware.local"} 
variable "license_key" {default = "NZ49H-001D2-080C0-R2272-96H10"}

# Datacenter Variables
variable "datacenter_name" {
  description = "(Required) The name of the datacenter to create"
  type        = string
  default     = "VMware Datacenter"
}

#Cluster Variables
variable "cluster_name" {
  description = "(Required) The name of the Cluster to create"
  type = string
  default = "Management"
}

variable "host_password" {
  description = "Host Password"
  type = string
  default = "VMware1!"
}

variable "esxi_license" {
  description = "ESXi License"
  type = string
  default = "NZ49H-001D2-080C0-R2272-96H10"
}


