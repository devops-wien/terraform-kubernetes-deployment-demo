/*
// todo: fixme - refactor to zone or check with terraform-data
resource "cloudflare_record" "sks_record" {
  zone_id = local.cloudflare_zone_id
  name    = "${var.subdomain}-${local.env_name}"
  value   = "${local.env_name}.${local.domain}"
  type    = "CNAME"
  ttl     = 1
  proxied = true
}
*/

resource "cloudflare_record" "sks_record_env" {
  zone_id = local.cloudflare_zone_id
  name    = "${var.subdomain}-${var.zone}-${local.env_name}"
  value   = "${var.zone}-${local.env_name}.${local.domain}"
  type    = "CNAME"
  ttl     = 1
  proxied = true
}

module "deployment" {
  source                 = "devops-wien/deployment/kubernetes"
  version                = "0.0.11"
  # source = "../terraform-kubernetes-deployment"
  client_certificate     = local.client_certificate
  client_key             = local.client_key
  cluster_ca_certificate = local.cluster_ca_certificate
  host                   = local.host
  dns_names              = [
    "${var.subdomain}-${local.env_name}.${local.domain}",
    "${var.subdomain}-${var.zone}-${local.env_name}.${local.domain}"
  ]
  image                  = var.image
  target_port            = var.target_port
  zone                   = var.zone
  name                   = var.subdomain
}

