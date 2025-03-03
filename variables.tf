variable "proxmox_endpoint" {
  description = "Proxmox API endpoint URL"
  type        = string
}

variable "proxmox_api_token" {
  description = "API token for Proxmox authentication"
  type        = string
  sensitive   = true
}

variable "proxmox_insecure" {
  description = "Whether to skip SSL validation"
  type        = bool
  default     = true
}

variable "ssh_agent" {
  description = "Enable SSH agent forwarding"
  type        = bool
  default     = true
}

variable "ssh_username" {
  description = "SSH username for provider access"
  type        = string
}

variable "ssh_private_key_path" {
  description = "Path to the SSH private key"
  type        = string
  default     = "~/.ssh/id_ed25519"
}

variable "vm_name" {
  description = "Name of the VM"
  type        = string
  default     = "terraform-provider-proxmox-ubuntu-vm"
}

variable "vm_description" {
  description = "Description of the VM"
  type        = string
  default     = "Managed by Terraform"
}

variable "vm_tags" {
  description = "Tags for the VM"
  type        = list(string)
  default     = ["terraform", "ubuntu"]
}

variable "node_name" {
  description = "Proxmox node name"
  type        = string
}

variable "vm_id" {
  description = "Unique VM ID"
  type        = number
}

variable "vm_cpu_cores" {
  description = "Number of CPU cores"
  type        = number
  default     = 4
}

variable "vm_cpu_type" {
  description = "CPU type"
  type        = string
  default     = "host"
}

variable "vm_memory" {
  description = "Dedicated memory in MB"
  type        = number
  default     = 4096
}

variable "disk_datastore_id" {
  description = "Datastore ID for VM disk"
  type        = string
}

variable "disk_interface" {
  description = "Disk interface type"
  type        = string
  default     = "scsi0"
}

variable "disk_iothread" {
  description = "Enable or disable iothread"
  type        = bool
  default     = false
}

variable "disk_discard" {
  description = "Discard option for disk"
  type        = string
  default     = "on"
}

variable "disk_size" {
  description = "Disk size in GB"
  type        = number
  default     = 40
}

variable "init_datastore_id" {
  description = "Datastore ID for initialization"
  type        = string
}

variable "dns_servers" {
  description = "List of DNS servers"
  type        = list(string)
  default     = ["1.1.1.1", "8.8.8.8"]
}

variable "ipv4_address" {
  description = "IPv4 address with CIDR"
  type        = string
}

variable "ipv4_gateway" {
  description = "IPv4 gateway"
  type        = string
}

variable "init_username" {
  description = "Initialization username"
  type        = string
}

variable "init_password" {
  description = "Initialization user password"
  type        = string
  sensitive   = true
}

variable "network_bridge" {
  description = "Network bridge for the VM"
  type        = string
  default     = "vmbr0"
}

variable "os_type" {
  description = "Operating system type"
  type        = string
  default     = "l26"
}
