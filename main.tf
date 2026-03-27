terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.66.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "1665b74d-faef-4dc7-bad6-1472afd412b6"
}

resource "azurerm_resource_group" "arg" {
  name     = "ContactBookRG"
  location = "germanywestcentral"
}

resource "random_integer" "ri" {
  min = 10000
  max = 99999

}

resource "azurerm_service_plan" "asp" {
  name                = "ContactBookASP${random_integer.ri.result}"
  resource_group_name = azurerm_resource_group.arg.name
  location            = azurerm_resource_group.arg.location
  os_type             = "Linux"
  sku_name            = "F1"
}

resource "azurerm_linux_web_app" "alwapp" {
  name                = "ContactBookApp${random_integer.ri.result}"
  resource_group_name = azurerm_resource_group.arg.name
  location            = azurerm_service_plan.asp.location
  service_plan_id     = azurerm_service_plan.asp.id

  site_config {
    application_stack {
      node_version = "20-lts"

    }
    always_on = false
  }
}

resource "azurerm_app_service_source_control" "assc" {
  app_id                 = azurerm_linux_web_app.alwapp.id
  repo_url               = "https://github.com/nakov/ContactBook.git"
  branch                 = "master"
  use_manual_integration = true
}