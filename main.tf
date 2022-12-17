
#Create ressource group for iaac-azure-tf-wapp
resource   "azurerm_resource_group"   "rg"   { 
  name                =   var.wap_rg_name 
  location            =   var.wap_rg_location

  tags = {
    owner       = "fred"
    dept        = "IT"
  }
}

resource "azurerm_app_service_plan" "wap_sp" {
  name                = var.wap_sap_name
  location            = var.wap_rg_location
  resource_group_name = var.wap_rg_name

  sku {
    tier = "Standard"
    size = "S1"
  }

  tags = {
    owner       = "fred"
    dept        = "IT"
  }

}