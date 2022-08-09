data "terraform_remote_state" "vpc" {
  backend = "remote"

  config = {
    organization = var.organization
    workspaces = {
      name = var.zone
    }
  }
}
