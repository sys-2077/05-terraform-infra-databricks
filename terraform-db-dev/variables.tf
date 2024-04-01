variable "location" {
  type        = string
  description = "Region where will be created"
}
variable "environment" {
  type        = string
  description = "Environment"
}
variable "node_type" {
  type        = string
  description = "Node type"
}
variable "max_workers" {
  type        = number
  description = "Max workers"
}