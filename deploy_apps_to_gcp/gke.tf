# # Enable the Kubernetes Engine API
# resource "google_project_service" "container_api" {
#   project = var.project_id
#   service = "container.googleapis.com"
# }

# # Define the GKE Cluster
# module "gke" {
#   source                   = "terraform-google-modules/kubernetes-engine/google"
#   project_id               = var.project_id
#   name                     = "gke-lab"
#   region                   = var.region
#   zones                    = var.zones
#   network                  = module.vpc.network_name
#   subnetwork               = module.vpc.subnets_names[0]
#   ip_range_pods            = module.vpc.subnets_secondary_ranges[0][0].range_name
#   ip_range_services        = module.vpc.subnets_secondary_ranges[0][1].range_name
#   remove_default_node_pool = true

#   node_pools = [
#     {
#       name               = "primary-node-pool"
#       machine_type       = "e2-micro"
#       node_locations     = var.zones[0]
#       min_count          = 3
#       max_count          = 3
#       local_ssd_count    = 0
#       disk_size_gb       = 100
#       disk_type          = "pd-standard"
#       image_type         = "COS_CONTAINERD"
#       auto_repair        = true
#       auto_upgrade       = true
#       service_account    = google_service_account.gke_sva.email
#       preemptible        = false
#       initial_node_count = 1
#     },
#   ]
# }