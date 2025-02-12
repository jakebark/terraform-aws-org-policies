locals {
  policies_directory = var.policies_directory == null ? lower(var.policy_type) : var.policies_directory
}
