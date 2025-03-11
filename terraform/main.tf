terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.73.0"
    }
  }
}

resource "proxmox_virtual_environment_vm" "ubuntu_vm_1" {
  name        = var.vm_name_1
  description = var.vm_description_1
  tags        = var.vm_tags

  node_name = var.node_name
  vm_id     = var.vm_id_1

  cpu {
    cores = var.vm_cpu_cores
    type  = var.vm_cpu_type
  }

  memory {
    dedicated = var.vm_memory
  }

  disk {
    datastore_id = var.disk_datastore_id
    file_id      = proxmox_virtual_environment_download_file.ubuntu_cloud_image.id
    interface    = var.disk_interface
    iothread     = var.disk_iothread
    discard      = var.disk_discard
    size         = var.disk_size
  }

  initialization {
    datastore_id = var.init_datastore_id

    dns {
      servers = var.dns_servers
    }

    ip_config {
      ipv4 {
        address = var.ipv4_address_1
        gateway = var.ipv4_gateway
      }
    }

    user_account {
      keys     = [local.private_key]
      password = var.init_password
      username = var.init_username
    }
  }

  network_device {
    bridge = var.network_bridge
  }

  operating_system {
    type = var.os_type
  }

  serial_device {}
}

resource "proxmox_virtual_environment_vm" "ubuntu_vm_2" {
  name        = var.vm_name_2
  description = var.vm_description_2
  tags        = var.vm_tags

  node_name = var.node_name
  vm_id     = var.vm_id_2

  cpu {
    cores = var.vm_cpu_cores
    type  = var.vm_cpu_type
  }

  memory {
    dedicated = var.vm_memory
  }

  disk {
    datastore_id = var.disk_datastore_id
    file_id      = proxmox_virtual_environment_download_file.ubuntu_cloud_image.id
    interface    = var.disk_interface
    iothread     = var.disk_iothread
    discard      = var.disk_discard
    size         = var.disk_size
  }

  initialization {
    datastore_id = var.init_datastore_id

    dns {
      servers = var.dns_servers
    }

    ip_config {
      ipv4 {
        address = var.ipv4_address_2
        gateway = var.ipv4_gateway
      }
    }

    user_account {
      keys     = [local.private_key]
      password = var.init_password
      username = var.init_username
    }
  }

  network_device {
    bridge = var.network_bridge
  }

  operating_system {
    type = var.os_type
  }

  serial_device {}
}

resource "proxmox_virtual_environment_download_file" "ubuntu_cloud_image" {
  content_type = "iso"
  datastore_id = "local"
  node_name    = var.node_name
  url          = "https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img"
}


resource "tls_private_key" "ubuntu_vm_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

output "ubuntu_vm_private_key" {
  value     = tls_private_key.ubuntu_vm_key.private_key_pem
  sensitive = true
}

output "ubuntu_vm_public_key" {
  value = tls_private_key.ubuntu_vm_key.public_key_openssh
}

locals {
  private_key = file(pathexpand(var.ssh_key_path))
}