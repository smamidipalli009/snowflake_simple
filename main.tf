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
  account  = var.snowflake_account
  username = var.snowflake_user
  password = var.snowflake_password
  role     = "SYSADMIN"
}

module "learning_db" {
  # Note the double-slash // — this tells Terraform the subfolder path
  # ref= must match an actual tag in your snowflake-terraform repo
  source = "git::https://github.com/smamidipalli009/snowflake-terraform.git//modules/database?ref=v1.0.0"

  name                 = "LEARNING_DB"
  comment              = "Test database — trial account"
  create_default_roles = false
}

output "database_name" {
  value = module.learning_db.database_name
}
