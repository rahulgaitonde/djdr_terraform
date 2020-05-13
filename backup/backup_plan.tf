# ----------------------------------------------------------------------------------------------------------------------
# REQUIRE A SPECIFIC TERRAFORM VERSION OR HIGHER
# This module has been updated with 0.12 syntax, which means it is no longer compatible with any versions below 0.12.
# ----------------------------------------------------------------------------------------------------------------------

terraform {
  required_version = ">= 0.12"
}

# ------------------------------------------------------------------------------
# CONFIGURE OUR AWS CONNECTION
# ------------------------------------------------------------------------------

provider "aws" {
  region = "us-east-1"
}

# ------------------------------------------------------------------------------
# BACKUP PLAN WITH RESOURCE ATTACHMENT WITH TAGS
# ------------------------------------------------------------------------------

resource "aws_backup_plan" "example" {
    name = "example-plan"
    rule {
      rule_name         = "tf_example_backup_rule"
      target_vault_name = "primary"
      schedule          = "cron(0 12 * * ? *)"
      recovery_point_tags =  {
        Environment = "STAGE"
        Department = "Ops"
      }
    copy_action {
    lifecycle {
      cold_storage_after = 30
      delete_after       = 120
    }
    destination_vault_arn = "arn:aws:backup:us-west-2:154204971707:backup-vault:secondary"
    }
    
    }

    tags = {
    Owner       = "RAHUL"
    Environment = "STAGE"
    Department = "Ops"
  }
}

resource "aws_backup_selection" "example" {
  iam_role_arn = "arn:aws:iam::154204971707:role/service-role/AWSBackupDefaultServiceRole"
  name         = "tf_example_backup_selection_ebs"
  plan_id      = "${aws_backup_plan.example.id}"

  selection_tag {
    type  = "STRINGEQUALS"
    key   = "Environment"
    value = "STAGE"
  }
}


resource "aws_backup_selection" "example-1" {
  iam_role_arn = "arn:aws:iam::154204971707:role/service-role/AWSBackupDefaultServiceRole"
  name         = "tf_example_backup_selection_ami"
  plan_id      = "${aws_backup_plan.example.id}"

  selection_tag {
    type  = "STRINGEQUALS"
    key   = "Environment"
    value = "STAGE-EBS"
  }
}

terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket         = "terraform-state-gaitonde"
    key            = "backup_plan/terraform.tfstate"
    region         = "us-east-1"
}

}