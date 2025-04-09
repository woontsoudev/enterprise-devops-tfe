terraform {
  cloud {

    organization = "woontsou"

    workspaces {
      name = "enterprise-devops-tfe"
    }
  }
}
