locals {
  project = {
    "enterprise-devops-project" = {
      description = "Enterprise devops project"
    }
  }

  workspace = {
    "enterprise-devops-tfe" = {
      description = "Enterprise devops workspace"
      execution_mode = "local"
      project_id = module.project["enterprise-devops-project"].id
    }
  }
}
