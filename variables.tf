
#### variable for subscription_id ####
variable "subscription_id" {
  type = string
  default = "a6f24a81-7804-44a9-b074-25a9781afd24"
}

#### variable for client_id ####
variable "client_id" {
  type = string
  default = "60ab9702-ec7c-4c22-a97b-99ca2dd561b9"
}

#### variable for tenant_id ####
variable "tenant_id" {
  type = string
  default = "4c8896b7-52b2-4cb4-9533-1dc0c937e1ed"
}

#### variable for client_secret ####
variable "client_secret" {
  type = string
  default = "J1X8Q~CafN2rr5oy0xW5FiB1GKY~gmk9uQhCectv"
}

variable "wap_rg_name" {
  type = string
  default = "wap-rg"
}

variable "wap_rg_location" {
  type = string
  default = "Switzerland North"
}

variable "wap_sp_name" {
  type = string
  default = "wap-sp"
}

variable "wap_sp_sku_name_F1" {
  type = string
  default = "B1"
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

variable "wap_dv_name" {
  type = string
  default = "wap-dv"
}

variable "wap_qa_name" {
  type = string
  default = "wap-qa"
}

variable "wap_pd_name" {
  type = string
  default = "wap-pd"
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