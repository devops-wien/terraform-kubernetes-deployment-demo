variable "zone" {
  description = "Zone"
  type        = string
  default     = "at-vie-1"
}

variable "organization" {
  type        = string
  description = "terraform organization name"
}

variable "target_port" {
  type    = number
  default = 3000
}

variable "image" {
  type    = string
  default = "devopswien/docker-nextjs-demo"
}

variable "subdomain" {
  type    = string
  default = "nextjs"
}
