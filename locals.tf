locals {
  cloudflare_api_token   = lookup(data.terraform_remote_state.vpc.outputs, "cloudflare_api_token", "")
  cluster_url            = lookup(data.terraform_remote_state.vpc.outputs, "cluster_url", "")
  cloudflare_zone_id     = lookup(data.terraform_remote_state.vpc.outputs, "cloudflare_zone_id", "")
  nlb_ip_address         = lookup(data.terraform_remote_state.vpc.outputs, "nlb_ip_address", "")
  client_certificate     = sensitive(lookup(data.terraform_remote_state.vpc.outputs, "client_certificate", ""))
  client_key             = sensitive(lookup(data.terraform_remote_state.vpc.outputs, "client_key", ""))
  cluster_ca_certificate = sensitive(lookup(data.terraform_remote_state.vpc.outputs, "cluster_ca_certificate", ""))
  host                   = lookup(data.terraform_remote_state.vpc.outputs, "host", "")
  domain                 = lookup(data.terraform_remote_state.vpc.outputs, "domain", "")
  env_name               = lookup(data.terraform_remote_state.vpc.outputs, "env_name", "")
}
