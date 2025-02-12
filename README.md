## terraform-aws-org-policies

Deploy SCPs, RCPs, and other organizational policies with Terraform.


## Module Inputs
SCP example:
```hcl
module "scps" {
  source = "github.com/jakebark/aws-organization-policies-with-terraform"
  policy_type = "SERVICE_CONTROL_POLICY"
  ou_map = {
    "r-1xyz"           = ["root", "allow_services"] #root
    "ou-abcd-11223344" = ["sandbox"]                #sandbox ou
    "ou-efgh-22334455" = ["ssm"]                    #workload ou
  }
}
```
RCP example:
```hcl
module "rcps" {
  source = "github.com/jakebark/aws-organization-policies-with-terraform"
  policy_type = "RESOURCE_CONTROL_POLICY"
  ou_map = {
    "r-1xyz"           = ["root"] #root
  }
}
```

`policy_type` is the type of organizational policy. Valid values are `AISERVICES_OPT_OUT_POLICY`, `BACKUP_POLICY`, `RESOURCE_CONTROL_POLICY`, `SERVICE_CONTROL_POLICY`, and `TAG_POLICY`.

A new module needs to be created for each policy type. 

`ou_map` is a map of OU IDs and the policies attached to them. Policies are stored as JSON files in an adjacent directory. The directory name defaults to the policy type, eg `./service_control_policy/`.

The above two module inputs would look like this:
```
.
├── resource_control_policy
│   └── rcp_root.json
├── service_control_policy
│   ├── allow_services.json
│   ├── root.json
│   ├── sandbox.json
│   └── ssm.json
└── main.tf 
```

### Optional Inputs

```hcl
module "scps" {
  ... 
  policies_directory = "policies"
}
```

`policies_directory` can be used to change the name and location of the directory used to store policies. Otherwise it will default to the name of the policy type. 


## Related Resources

- [SCP examples](https://github.com/aws-samples/service-control-policy-examples)
- [RCP examples](https://github.com/aws-samples/data-perimeter-policy-examples/tree/main/resource_control_policies)
- [aws-samples/aws-scps-with-terraform](https://github.com/aws-samples/aws-scps-with-terraform)

