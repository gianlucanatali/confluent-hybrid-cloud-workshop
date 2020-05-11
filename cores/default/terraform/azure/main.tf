provider "azurerm" {
  version         = "=2.0.0"
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  features {}
}

provider "random" {
  version = "~> 2.2"
}

module "workshop-core" {
  source                    = "github.com/gianlucanatali/confluent-hybrid-cloud-workshop//resources/terraform/azure-ws-core?ref=new_structure"
  name                      = var.name
  participant_count         = var.participant_count
  participant_password      = var.participant_password
  location                  = var.location
  vm_type                   = var.vm_type
  ccloud_bootstrap_servers  = var.ccloud_bootstrap_servers
  ccloud_api_key            = var.ccloud_api_key
  ccloud_api_secret         = var.ccloud_api_secret
  ccloud_topics             = var.ccloud_topics
  feedback_form_url         = var.feedback_form_url
  bootstrap_docker_template_path  = "./common/bootstrap_docker.tpl"
  bootstrap_vm_template_path      = "./common/bootstrap_vm.tpl"
}

