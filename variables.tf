variable "name" {
  type = string
}

variable "env" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "rds_cidr_blocks_ingress" {
  type = list(string)
}

variable "allocated_storage" {
  type = number
}

variable "max_allocated_storage" {
  type = number
}

variable "engine" {
  type = string
}

variable "engine_version" {
  type = string
}

variable "instance_class" {
  type = string
}

variable "parameter_group_name" {
  type = string
}

variable "storage_encrypted" {
  type = string
}

variable "backup_retention_period" {
  type = number
}

variable "backup_window" {
  type = string
}

variable "maintenance_window" {
  type = string
}

variable "rds_subnet_ids" {
  type = list(string)
}

variable "rds_subnet_ids_private" {
  type = list(string)
}

#variable "route53_zone_id" {
#  type = string
#}

#variable "route53_domain" {
#  type = string
#}

variable "performance_insights" {
  type = string
}
