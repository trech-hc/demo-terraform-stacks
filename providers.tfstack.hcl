# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

required_providers {
  aws = {
    source  = "hashicorp/aws"
    version = "~> 5.7.0"
  }

  random = {
    source  = "hashicorp/random"
    version = "~> 3.5.1"
  }

  archive = {
    source  = "hashicorp/archive"
    version = "~> 2.4.0"
  }

  local = {
    source  = "hashicorp/local"
    version = "~> 2.4.0"
  }
}

provider "aws" "configurations" {
  for_each = var.regions

  config {
    region = each.value

    assume_role_with_web_identity {
      role_arn           = var.role_arn
      web_identity_token = var.identity_token
    }

    default_tags {
      tags = var.default_tags
    }
  }
}
provider "aws" "alternative" {
  for_each = var.regions

  config {
    region = each.value

    assume_role_with_web_identity {
      role_arn           = var.role_arn_alt
      web_identity_token = var.identity_token
    }

    default_tags {
      tags = var.default_tags
    }
  }
}
provider "random" "this" {}
provider "archive" "this" {}
provider "local" "this" {}
