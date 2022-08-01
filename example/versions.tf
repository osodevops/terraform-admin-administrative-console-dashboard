terraform {

  cloud {
    organization = "osodevops"

    workspaces {
      name = "admin-administrative-console-dashboard"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.24.0"
    }
  }

  required_version = ">= 1.0.0"
}