# project_id   = "Your Project" - Input variable, leave commented out
# company_name = "company name" - Input variable, leave commented
region  = "europe-west1"
zone    = "europe-west1-c"
zones   = ["europe-west1-b", "europe-west1-c", "europe-west1-d"]
network = "abc-vpc"
subnet  = "abc-subnet"
subnet1 = "abc-subnet1"
tags    = ["allow-health-check"]
subnetworks = [
  {
    name                     = "abc-subnet1"
    source_ip_ranges_to_nat  = ["ALL_IP_RANGES"]
    secondary_ip_range_names = []
  },
]