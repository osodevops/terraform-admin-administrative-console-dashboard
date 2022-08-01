terraform {

  cloud {
    organization = "osodevops"

    workspaces {
      name = "admin-administrative-console-dashboard"
    }
  }
}