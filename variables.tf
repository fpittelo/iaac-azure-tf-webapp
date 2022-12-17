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