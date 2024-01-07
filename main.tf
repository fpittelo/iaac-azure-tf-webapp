
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

# data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "iaacvault" {
  name                            = var.vault_name
  location                        = var.wap_rg_location
  resource_group_name             = var.wap_rg_name
  tenant_id                       = var.tenant_id
  sku_name                        = "standard"
  enabled_for_deployment          = true
  enabled_for_disk_encryption     = true
  enabled_for_template_deployment = true
# soft_delete_retention_days      = 7
  purge_protection_enabled        = false
  public_network_access_enabled   = true
  
  network_acls {
    default_action  = "Allow"
    bypass          = "AzureServices"
  }
  
  access_policy {
  tenant_id = var.tenant_id
  object_id = var.sp_object_id
  # tenant_id = data.azurerm_client_config.current.tenant_id
  # object_id = data.azurerm_client_config.current.object_id
    
    certificate_permissions = [
      "Get",
      "List",
      "Create",
      "Update",
      "Delete",
      "Purge",
    ]

    key_permissions = [
      "Get",
      "List",
      "Create",
      "Update",
      "Delete",
      "Purge",
    ]
    
    secret_permissions = [
      "Delete",
      "Purge",
    ]
    
    storage_permissions = [
      "Delete",
      "Purge",
    ]
  }
}

resource "azurerm_key_vault_certificate" "iaac_webapp_cert" {
  name                  = "iaac-webapp-cert"
  key_vault_id          = azurerm_key_vault.iaacvault.id
  depends_on            = [ azurerm_key_vault.iaacvault ]

    certificate_policy {
    issuer_parameters {
      name = "Self"
    }
    secret_properties {
      content_type = "application/x-pkcs12"
    }
    key_properties {
      exportable = true
      key_type = "RSA"
      key_size = 2048
      reuse_key = false
    }
    x509_certificate_properties {
      subject = "CN=fpittelo.ch"
      validity_in_months = 36
      key_usage = [
        "digitalSignature",
        "keyEncipherment",
      ]
      extended_key_usage = [
        "1.3.6.1.5.5.7.3.1",  // OID for serverAuth
        "1.3.6.1.5.5.7.3.2",  // OID for clientAuth, include if needed
      ]
    }
  }
}

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
  depends_on = [ azurerm_key_vault_certificate.iaac_webapp_cert ]

  site_config {
    default_documents = ["index.html","index.htm"]
    application_stack {
      php_version = "8.2"
    }
  }
}

resource "azurerm_log_analytics_workspace" "iaac_webapp_logs" {
  name                = "iaac-webapp-logs"
  resource_group_name = var.wap_rg_name
  location            = var.wap_rg_location
  sku                 = "PerGB2018"
  retention_in_days   = 30

  tags = {
    project     = var.project
    owner       = var.owner
    dept        = var.department
    status      = var.wap_status_dv
  }
}

resource "azurerm_monitor_diagnostic_setting" "webapp_diag_setting" {
  name                        = "webapp-diag-setting"
  target_resource_id          = azurerm_linux_web_app_slot.dev.id
  log_analytics_workspace_id  = azurerm_log_analytics_workspace.iaac_webapp_logs.id

  enabled_log {
    category  = "AppServiceHTTPLogs"
  }
}

#resource "azurerm_monitor_diagnostic_setting" "iaacvault" {
# name                        = "iaac-webapp-vault-logs"
# target_resource_id          = azurerm_key_vault.iaacvault.id
# log_analytics_workspace_id  = azurerm_log_analytics_workspace.iaac_webapp_logs.id
#
# enabled_log {
#   category  = "AuditEvent"
# }
# metric {
#   category = "AllMetrics"
#   enabled = true
# }
#}

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

###### The End ####