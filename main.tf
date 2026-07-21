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

# ─────────────────────────────────────────────────────────────
# Pull the database module directly from your snowflake-terraform
# repo using the git tag created by module-ci.yml (e.g. v1.0.1)
# ─────────────────────────────────────────────────────────────
module "learning_db" {
  source = "git::https://github.com/smamidipalli009/snowflake-terraform.git//modules/database?ref=v1.0.0"

  name                = "LEARNING_DB"
  comment             = "Test database — trial account"
  data_retention_days = 0
  create_default_roles = false
}

output "database_name" {
  value = module.learning_db.database_name
}
