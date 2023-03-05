variable "project_id" {
  description = "Project ID"
  type        = string
}

variable "region" {
  description = "GCP primary region identifier"
  type        = string
}

variable "zone" {
  description = "GCP primary zone identifier"
  type        = string
}

variable "zones" {
  description = "GCP zone identifier"
  type        = list(any)
}

variable "company_name" {
  description = "Company name"
  type        = string
}

variable "network" {
  description = "GCP VPC network"
  type        = string

}

variable "subnet" {
  description = "GCP primary VPC subnet"
  type        = string

}

variable "subnets" {
  description = "GCP primary VPC subnet"
  type        = list(any)

}

variable "tags" {
  description = "Network tags"
  type        = list(string)
  default     = []
}


variable "names" {
  description = "A list of IP address resource names to create.  This is the GCP resource name and not the associated hostname of the IP address.  Existing resource names may be found with `gcloud compute addresses list` (e.g. [\"gusw1-dev-fooapp-fe-0001-a-001-ip\"])"
  type        = list(string)
  default     = []
}

variable "lb_address" {
  description = "A list of IP address resource names to create.  This is the GCP resource name and not the associated hostname of the IP address.  Existing resource names may be found with `gcloud compute addresses list` (e.g. [\"gusw1-dev-fooapp-fe-0001-a-001-ip\"])"
  type        = string
  default     = ""
}

variable "addresses" {
  description = "A list of IP addresses to create.  GCP will reserve unreserved addresses if given the value \"\".  If multiple names are given the default value is sufficient to have multiple addresses automatically picked for each name."
  type        = list(string)
  default     = [""]
}

variable "address" {
  type        = string
  description = "IP address"
  default     = ""
}