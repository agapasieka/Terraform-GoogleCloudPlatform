resource "google_project_service" "vpcaccess" {
  provider           = google-beta
  service            = "vpcaccess.googleapis.com"
  disable_on_destroy = false
}
  
module "serverless-connector" {
  source     = "terraform-google-modules/network/google//modules/vpc-serverless-connector-beta"
  project_id = var.project_id
  
  vpc_connectors = [{
    name            = "${var.company_name}-connector"
    region          = var.region
    subnet_name     = var.subnet1
    host_project_id = var.project_id
    machine_type    = "e2-standard-4"
    min_instances   = 2
    max_instances   = 7
    max_throughput  = 700
  
  }]
  depends_on = [
    google_project_service.vpcaccess,
    module.vpc
  ]
  
}
  
### Output VPC serverless connector ID
output "Serverless_VPC_id" {
  description = "VPC serverless connector ID"
  value       = module.serverless-connector.connector_ids
}

