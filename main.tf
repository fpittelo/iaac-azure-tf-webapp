
#Create ressource group for iaac-azure-tf-wapp
#resource   "azurerm_resource_group"   "rg"   { 
# name                =   var.wap_rg_name 
# location            =   var.wap_rg_location
#
# tags = {
#   project     = var.project
#   owner       = var.owner
#   dept        = var.department
# }
#}

resource "azurerm_service_plan" "wap_sp_webapp" {
  name                = var.wap_sp_name
  location            = var.wap_rg_location
  resource_group_name = var.wap_rg_name
  sku_name            = var.wap_sp_sku
  os_type             = var.wap_sp_sku_os_linux

  tags = {
    project     = var.project
    owner       = var.owner
    dept        = var.department
  }

}

resource "azurerm_linux_web_app" "wap_webapp" {
  name                = var.wap_webapp_name
  resource_group_name = var.wap_rg_name
  location            = var.wap_rg_location
  service_plan_id     = azurerm_service_plan.wap_sp_webapp.id

  tags = {
    project     = var.project
    owner       = var.owner
    dept        = var.department
    status      = var.wap_status_dv
  }

  site_config {
    default_documents = ["index.html","index.htm"]
    application_stack {
      php_version = "8.2"
    }
  }
}

resource "azurerm_linux_web_app_slot" "dev" {
  name            = "dev"
  app_service_id  = azurerm_linux_web_app.wap_webapp.id

  site_config {
    default_documents = ["index.html","index.htm"]
    application_stack {
      php_version = "8.2"
    }
  }
}

resource "azurerm_log_analytics_workspace" "iaac-webapp-logs" {
  name                = "iaac-webapp-logs"
  resource_group_name = var.wap_rg_name
  location            = var.wap_rg_location
  sku                 = "Standard"
  retention_in_days   = 30

  tags = {
    project     = var.project
    owner       = var.owner
    dept        = var.department
    status      = var.wap_status_dv
  }
}

resource "azurerm_linux_web_app_slot" "qa" {
  name            = "qa"
  app_service_id  = azurerm_linux_web_app.wap_webapp.id

  site_config {
    default_documents = ["index.html","index.htm"]
    application_stack {
      php_version = "8.2"
    }
  }
}

resource "azurerm_linux_web_app_slot" "prod" {
  name            = "prod"
  app_service_id  = azurerm_linux_web_app.wap_webapp.id

  site_config {
    default_documents = ["index.html","index.htm"]
    application_stack {
      php_version = "8.2"
    }
  }
}

#resource "azurerm_linux_web_app" "wap_webapp_qa" {
# name                = var.wap_qa_name
# resource_group_name = var.wap_rg_name
# location            = var.wap_rg_location
# service_plan_id     = azurerm_service_plan.wap_sp_name.id
#
#  tags = {
#   project     = var.project
#   owner       = var.owner
#   dept        = var.department
#   status      = var.wap_status_qa
# }

# site_config {
#   default_documents = ["index.html","index.htm"]
#   application_stack {
#     php_version = "8.2"
#   }
# }
#}

#resource "azurerm_linux_web_app" "wap_pd_name" {
# name                = var.wap_pd_name
# resource_group_name = var.wap_rg_name
# location            = var.wap_rg_location
# service_plan_id     = azurerm_service_plan.wap_sp_name.id

# tags = {
#   project     = var.project
#   owner       = var.owner
#   dept        = var.department
#   status      = var.wap_status_pd
# }

# site_config {
#   default_documents = ["index.html","index.htm"]
#   application_stack {
#     php_version = "8.2"
#   }    
# }
#}