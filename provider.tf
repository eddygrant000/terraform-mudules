provider "aws" {
  region = var.region
  shared_credentials_file = "${var.project_name}.credentials"
  profile = var.environment_name
}
