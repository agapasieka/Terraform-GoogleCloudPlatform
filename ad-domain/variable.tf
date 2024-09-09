variable "project_id" {
  description = "Project ID"
  type        = string
}

variable "region" {
  description = "main region"
  type        = string
}

variable "regions" {
  description = "region list"
  type        = list(string)
}

variable "zones" {
  description = "zone list"
  type        = list(string)
}

variable "subnets" {
  description = "subnets list for vpc"
  type        = list(string)
}