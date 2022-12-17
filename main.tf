
#Create ressource group for iaac-azure-tf-wapp
resource   "azurerm_resource_group"   "rg"   { 
  name                =   var.rg_name 
  location            =   var.rg_location 
}
