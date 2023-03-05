# VPC
module "vpc" {
  source       = "terraform-google-modules/network/google"
  project_id   = var.project_id
  network_name = var.network
  version      = "5.0"

  subnets = [

    {
      subnet_name           = var.subnet
      subnet_ip             = "10.10.1.0/29"
      subnet_region         = var.region
      subnet_private_access = true
    },

    {
      subnet_name   = var.subnet1
      subnet_ip     = "10.10.10.0/28"
      subnet_region = var.region

    },
  ]
}
