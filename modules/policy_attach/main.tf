resource "aws_organizations_policy_attachment" "this" {
  for_each  = toset(var.policies)
  policy_id = var.policy_id["${var.policies_directory_name}/${each.value}.json"].id
  target_id = var.ou
}

