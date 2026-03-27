variable "subscription_id" {
  description = "The subscription ID to use for deploying resources."
  type        = string

}

variable "resource_group_name" {
  description = "The name of the resource group to create."
  type        = string
}

variable "location" {
  description = "The location where the resource group will be created."
  type        = string

}
variable "app_service_plan_name" {
  description = "The name of the app service plan."
  type        = string
}

variable "app_service_name" {
  description = "The name of the app service."
  type        = string
}

variable "sql_server_name" {
  description = "The name of the SQL server."
  type        = string
}

variable "sql_database_name" {
  description = "The name of the SQL database."
  type        = string
}

variable "sql_admin_username" {
  description = "The administrator username for SQL server."
  type        = string
}

variable "sql_admin_password" {
  description = "The administrator password for SQL server."
  type        = string
  sensitive   = true
}

variable "firewall_rule_name" {
  description = "The name of the firewall rule."
  type        = string
}

variable "github_repo_url" {
  description = "The GitHub repository URL."
  type        = string
}