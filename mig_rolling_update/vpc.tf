module "vpc" {
  source       = "terraform-google-modules/network/google"
  project_id   = var.project_id
  network_name = var.network
  version      = "6.0.1"

  subnets = [

    {
      subnet_name   = var.subnet
      subnet_ip     = "10.10.1.0/24"
      subnet_region = var.region

    },
    {
      subnet_name   = var.subnet1
      subnet_ip     = "10.10.2.0/24"
      subnet_region = var.region

    },
  ]
}
