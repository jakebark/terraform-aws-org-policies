// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: MIT-0

variable "ou_list" {
  type = list(string)
}

variable "policies_directory_name" {
  type    = string
  default = "policies"
}
