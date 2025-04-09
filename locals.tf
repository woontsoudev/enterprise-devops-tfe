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
      vcs_repo_identifier = "woontsoudev/enterprise-devops-terraform-tfe"
    }

    "enterprise-devops-github" = {
      description = "Enterprise devops workspace for github"
      execution_mode = "local"
      project_id = module.project["enterprise-devops-project"].id
      vcs_repo_identifier = "woontsoudev/enterprise-devops-terraform-github"
    }
  }
}
