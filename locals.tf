locals {
  project = {
    "enterprise-devops-project" = {
      description = "Enterprise devops project"
    }
  }

  workspace = {
    "enterprise-devops-tfe" = {
      description = "Enterprise devops workspace"
      execution_mode = "remote"
      project_id = module.project["enterprise-devops-project"].id
      vcs_repo_identifier = "${var.github_organization_name}/enterprise-devops-tfe"
    }

    "enterprise-devops-github" = {
      description = "Enterprise devops workspace for github"
      execution_mode = "remote"
      project_id = module.project["enterprise-devops-project"].id
      vcs_repo_identifier = "${var.github_organization_name}/enterprise-devops-github"
    }

    "enterprise-devops-aws-network" = {
      description         = "Automation for AWS network resources."
      execution_mode      = "remote"
      project_id          = module.project["enterprise-devops-project"].id
      vcs_repo_identifier = "${var.github_organization_name}/enterprise-devops-terraform-aws-network"

      variables = [
        {
          category = "terraform"
          hcl      = true
          key      = "azs"
          value    = jsonencode(["us-east-1a", "us-east-1b"])
        },
        {
          category = "terraform"
          key      = "cidr"
          value    = "10.0.0.0/16"
        },
        {
          category = "terraform"
          key      = "name"
          value    = "enterprise-devops"
        },
      ]
    }

    "enterprise-devops-aws-cluster-prod" = {
      description         = "Automation for AWS cluster resources."
      execution_mode      = "remote"
      project_id          = module.project["enterprise-devops-project"].id
      vcs_repo_identifier = "${var.github_organization_name}/enterprise-devops-terraform-aws-cluster"

      variables = [
        {
          category = "terraform"
          key      = "domain"
          value    = "woontsou.com"
        },
        {
          category = "terraform"
          key      = "environment"
          value    = "prod"
        },
        {
          category = "terraform"
          key      = "name"
          value    = "enterprise-devops-woontsou"
        },
        {
          category = "terraform"
          key      = "vpc_name"
          value    = "enterprise-devops"
        },
      ]
    }
  }
}
