#### variable for subscription_id ####
variable "subscription_id" {
  type    = string
  default = "a6f24a81-7804-44a9-b074-25a9781afd24"
}

#### variable for client_id ####
variable "client_id" {
  type    = string
  default = "79ec6375-29a4-4e5d-93a9-206c5950f369"
}

#### variable for tenant_id ####
variable "tenant_id" {
  type    = string
  default = "4c8896b7-52b2-4cb4-9533-1dc0c937e1ed"
}

#### variable for vault_name ####
variable "vault_name" {
  type    = string
  default = "iaac-webapp-vault"
}

#### variable for iaac-service enterprise application object id ####
variable "sp_object_id" {
  type    = string
  default = "32866622-cfa0-40f3-8ba9-581a1d0cf76b"
}

#### variable for client_secret ####
variable "client_secret" {
  type    = string
  default = "Oq58Q~ZubrsaZ2hRONLsLrb1IYzsGRwa_8G7MbWL"
}

#### variable for tag project ####
variable "project" {
  default = "iaac-azure-tf-webapp"
}

#### variable for tag dev qa prod ####
variable "status" {
  type    = list(string)
  default = ["dev", "qa", "prod"]
}

variable "wap_rg_name" {
  type = string
  default = "LABS"
}

variable "wap_sa_name" {
  type = string
  default = "iaaclabs"
}

variable "wap_cont_name" {
  type = string
  default = "iaacazuretfwebapp"
}

variable "wap_rg_location" {
  type = string
  default = "Switzerland North"
}

variable "wap_sp_name" {
  type = string
  default = "wap-sp-webapp"
}

variable "wap_sp_sku" {
  type = string
  default = "S1"
}

variable "wap_sp_sku_os_linux" {
  type = string
  default = "Linux"
}

variable "owner" {
  type = string
  default = "Fred"
}

variable "department" {
  type = string
  default = "IT"
}

variable "wap_webapp_name" {
  type = string
  default = "wap-webapp"
}

variable "wap_webapp_qa" {
  type = string
  default = "wap-webapp-qa"
}

variable "wap_webapp_prod" {
  type = string
  default = "wap-webapp-prod"
}

variable "wap_status_dv" {
  type = string
  default = "development"
}

variable "wap_status_qa" {
  type = string
  default = "quality"
}

variable "wap_status_pd" {
  type = string
  default = "production"
}