module "vpc" {
  source       = "terraform-google-modules/network/google"
  project_id   = var.project_id
  network_name = "my-network"
  version      = "9.1.0"

  subnets = [

    {
      subnet_name   = "dc-subnet1"
      subnet_ip     = "10.1.0.0/24"
      subnet_region = var.regions[0]
    },
    {
      subnet_name   = "dc-subnet2"
      subnet_ip     = "10.2.0.0/24"
      subnet_region = var.regions[1]
    },
  ]
}