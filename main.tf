
#Create ressource group for iaac-azure-tf-wapp
resource   "azurerm_resource_group"   "rg"   { 
  name                =   var.wap_rg_name 
  location            =   var.wap_rg_location

  tags = {
    owner       = var.owner
    dept        = var.department
  }
}

resource "azurerm_service_plan" "wap_sp" {
  name                = var.wap_sap_name
  location            = var.wap_rg_location
  resource_group_name = var.wap_rg_name
  sku_name            = var.wap_sp_sku_name_P1v2
  os_type             = var.wap_sp_sku_os_linux

  tags = {
    owner       = var.owner
    dept        = var.department
  }

}