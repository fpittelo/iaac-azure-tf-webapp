
#Create ressource group for iaac-azure-tf-wapp ####
resource   "azurerm_resource_group"   "rg"   { 
  name                =   var.wap_rg_name 
  location            =   var.wap_rg_location

  tags = {
    owner       = var.owner
    dept        = var.department
  }
}

resource "azurerm_service_plan" "wap_sp_name" {
  name                = var.wap_sp_name
  location            = var.wap_rg_location
  resource_group_name = var.wap_rg_name
  sku_name            = var.wap_sp_sku_name_F1
  os_type             = var.wap_sp_sku_os_linux
  depends_on          = [azurerm_resource_group.rg]

  tags = {
    owner       = var.owner
    dept        = var.department
  }

}

resource "azurerm_linux_web_app" "wap_dv_name" {
  name                = var.wap_dv_name
  resource_group_name = var.wap_rg_name
  location            = var.wap_rg_location
  service_plan_id     = azurerm_service_plan.wap_sp_name.id
  depends_on          = [azurerm_resource_group.rg, azurerm_service_plan.wap_sp_name]

  tags = {
    owner       = var.owner
    dept        = var.department
    status      = var.wap_status_dv
  }

  site_config {}
}

resource "azurerm_linux_web_app" "wap_qa_name" {
  name                = var.wap_qa_name
  resource_group_name = var.wap_rg_name
  location            = var.wap_rg_location
  service_plan_id     = azurerm_service_plan.wap_sp_name.id
  depends_on          = [azurerm_resource_group.rg, azurerm_service_plan.wap_sp_name]

  tags = {
    owner       = var.owner
    dept        = var.department
    status      = var.wap_status_qa
  }

  site_config {}
}

resource "azurerm_linux_web_app" "wap_pd_name" {
  name                = var.wap_pd_name
  resource_group_name = var.wap_rg_name
  location            = var.wap_rg_location
  service_plan_id     = azurerm_service_plan.wap_sp_name.id
  depends_on          = [azurerm_resource_group.rg, azurerm_service_plan.wap_sp_name]

  tags = {
    owner       = var.owner
    dept        = var.department
    status      = var.wap_status_pd
  }

  site_config {}
}