variable "project_id" {
  description = "Project ID"
  type        = string
}

variable "region" {
  description = "Main Region"
  type        = string
}

variable "zones" {
  description = "Zones"
  type        = list(string)
}
