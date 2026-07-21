variable "snowflake_organization" {
  description = "Your Snowflake organization name (e.g. MYORG)"
  type        = string
}

variable "snowflake_account" {
  description = "Your Snowflake account name (e.g. MYACCOUNT) — without the org prefix"
  type        = string
}

variable "snowflake_user" {
  description = "Your Snowflake username"
  type        = string
}

variable "snowflake_password" {
  description = "Your Snowflake password"
  type        = string
  sensitive   = true
}
