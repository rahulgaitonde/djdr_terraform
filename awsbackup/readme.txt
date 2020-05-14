cd /Users/rahulgaitonde/aws/awsbackup

#To create two vaults run the commands as under
aws backup create-backup-vault --backup-vault-name primary --region us-east-1
aws backup create-backup-vault --backup-vault-name secondary --region us-west-2

# Create a backupplan.json 
aws backup create-backup-plan --backup-plan file:///Users/rahulgaitonde/aws/awsbackup/backupplan.json --region us-east-1
# Keep a note of the backup plan id
{
    "BackupPlanId": "52a60404-206d-48a1-bf7c-5765baa9a202",
    "BackupPlanArn": "arn:aws:backup:us-east-1:154204971707:backup-plan:52a60404-206d-48a1-bf7c-5765baa9a202",
    "CreationDate": 1587038391.087,
    "VersionId": "MGYxZmYwMGItOGY4Mi00NWI4LTkxOTUtMzdiNGFkOTM2NWZh"
}


#Assign a resource to backup plan
aws backup create-backup-selection --backup-plan-id 8c83897c-f28c-414b-b35b-a0e782a4b34f --backup-selection file:///Users/rahulgaitonde/aws/awsbackup/selection.json --region us-east-1
#output
{
    "SelectionId": "420fedd5-b00b-48ef-b9aa-a9bc5faae61a",
    "BackupPlanId": "52a60404-206d-48a1-bf7c-5765baa9a202",
    "CreationDate": 1587038521.721
}

#Restore the AMI Instance in Oregon Vault (uuid -r 4c8f16be-7912-11ea-bc55-0242ac130003)  https://www.uuidgenerator.net/***  (An error occurred (InvalidParameterValueException) when calling the StartRestoreJob operation: Restore job 396AE813-1DE0-9390-51BE-6B3D6C5F33B4 already finished)


aws backup start-restore-job \
--recovery-point-arn arn:aws:ec2:us-west-2::image/ami-0b61dd03d30c9e021 \
--metadata file:///Users/rahulgaitonde/aws/awsbackup/test.json \
--iam-role-arn arn:aws:iam::154204971707:role/service-role/AWSBackupDefaultServiceRole \
--idempotency-token 0ee847b4-8325-11ea-bc55-0242ac130003 \
--resource-type EC2 --region us-west-2 









###***You can restore the AMI using the StartRestoreJob API call. For the restore process, its really important to identify the restore metadata before initiating a restore. Some of the restore metadata can be captured by doing a GetRecoveryPointRestoreMetadata API call while additional values may be required based on the user requirement for example which instance type or security group you would like to restore the AMI ****

 aws backup get-recovery-point-restore-metadata \
--backup-vault-name Default \
--recovery-point-arn arn:aws:ec2:us-west-2::image/ami-04555b9b3720fcb7f \
--region us-west-2



aws backup get-recovery-point-restore-metadata \
--backup-vault-name secondary \
--recovery-point-arn arn:aws:ec2:us-west-2::image/ami-0a3be41f5082299ba \
--region us-west-2



#Tags
#With respect to creating selection based on tags, you simply need to use a JSON file like this:
#In case, you just want to use tag based selection, you can remove the "Resources" line from the JSON and just have "ListOfTags" attribute in the JSON.

{
    "SelectionName": "Myselection",
    "IamRoleArn": "arn:aws:iam::123456789:role/service-role/AWSBackupDefaultServiceRole",
    "Resources": ["arn:aws:ec2:eu-west-1:123456789:volume/vol-0abcdef1234"],
    "ListOfTags": [{
        "ConditionType": "STRINGEQUALS",
        "ConditionKey": "backup",
        "ConditionValue": "yes"
    }]
}

