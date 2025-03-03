provider "proxmox" {
  endpoint  = var.proxmox_endpoint
  api_token = var.proxmox_api_token
  insecure  = var.proxmox_insecure

  ssh {
    agent       = var.ssh_agent
    username    = var.ssh_username
    private_key = file(var.ssh_private_key_path)
  }
}
