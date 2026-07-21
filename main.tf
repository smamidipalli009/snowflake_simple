terraform {
  required_version = ">= 1.5.0"

  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "~> 0.90"
    }
  }
}

provider "snowflake" {
  organization_name = var.snowflake_organization
  account_name      = var.snowflake_account
  username          = var.snowflake_user
  password          = var.snowflake_password
  role              = "SYSADMIN"
}

module "learning_db" {
  source = "git::https://github.com/smamidipalli009/snowflake-terraform.git//modules/database?ref=v1.0.0"

  name = "SWETA_DB"
}

output "database_name" {
  value = module.learning_db.database_name
}
