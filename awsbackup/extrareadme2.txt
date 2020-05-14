aws configure --profile default

#Crete a backup plan
aws backup create-backup-plan \
--backup-plan "{\"BackupPlanName\":\"Rahul-Test-Backup-Plan\",\"Rules\":[{\"RuleName\":\"DailyBackups\",\"ScheduleExpression\":\"cron(0 5 ? * * *)\",\"StartWindowMinutes\":480,\"TargetBackupVaultName\":\"Default\",\"Lifecycle\":{\"DeleteAfterDays\":35}}]}"

#Create a vault
aws backup create-backup-vault \
    --backup-vault-name test-vault-oregon

#Create a vault
aws backup create-backup-vault \
    --backup-vault-name test-vault-virginia

#List all the vaults in the region 
aws backup list-backup-vaults

#Resource assignment to backup plan


#How to restore the AMI in aws backup fault in oregon region 
aws backup start-restore-job \
--recovery-point-arn arn:aws:ec2:us-west-2::image/ami-04555b9b3720fcb7f \
--metadata { "CapacityReservationSpecification": "{\"CapacityReservationPreference\":\"open\"}",
        "CpuOptions": "{\"CoreCount\":1,\"ThreadsPerCore\":1}",
        "CreditSpecification": "{\"CpuCredits\":\"standard\"}",
        "DisableApiTermination": "false",
        "EbsOptimized": "false",
        "HibernationOptions": "{\"Configured\":false}",
        "InstanceInitiatedShutdownBehavior": "stop",
        "InstanceType": "t2.micro",
        "KeyName": "AWSDevOps", \
        "Monitoring": "{\"State\":\"disabled\"}",
        "NetworkInterfaces": "[{\"AssociatePublicIpAddress\":true,\"DeleteOnTermination\":true,\"Description\":\"\",\"DeviceIndex\":0,\"Groups\":[\"sg-0ec24b8fa4b23c700\"],\"Ipv6AddressCount\":0,\"Ipv6Addresses\":[],\"NetworkInterfaceId\":\"eni-094e1ec04863821ae\",\"PrivateIpAddress\":\"172.31.36. 129\",\"PrivateIpAddresses\":[{\"Primary\":true,\"PrivateIpAddress\":\"172.31.36.129\"}],\"SecondaryPrivateIpAddressCount\":0, \"SubnetId\":\"subnet-872f9bda\",\"InterfaceType\":\"interface\"}]",
        "Placement": "{\"AvailabilityZone\":\"us-east-1c\",\"GroupName\":\"\",\"Tenancy\":\"default\"}",
        "SecurityGroupIds": "[\"sg-0ec24b8fa4b23c700\"]",
        "SubnetId": "subnet-872f9bda",
        "VpcId": "vpc-87d09dff",
        "aws:backup:request-id": "e9908485-bb92-496e-b349-ade6e1fd2c4b" } 
--iam-role-arn arn:aws:iam::154204971707:role/service-role/AWSBackupDefaultServiceRole



"BackupVaultArn": "arn:aws:backup:us-west-2:154204971707:backup-vault:Default",
    "RecoveryPointArn": "arn:aws:ec2:us-west-2::image/ami-04555b9b3720fcb7f",
    "RestoreMetadata": {
        "CapacityReservationSpecification": "{\"CapacityReservationPreference\":\"open\"}",
        "CpuOptions": "{\"CoreCount\":1,\"ThreadsPerCore\":1}",
        "CreditSpecification": "{\"CpuCredits\":\"standard\"}",
        "DisableApiTermination": "false",
        "EbsOptimized": "false",
        "HibernationOptions": "{\"Configured\":false}",
        "InstanceInitiatedShutdownBehavior": "stop",
        "InstanceType": "t2.micro",
        "KeyName": "AWSDevOps",
        "Monitoring": "{\"State\":\"disabled\"}",
        "NetworkInterfaces": "[{\"AssociatePublicIpAddress\":true,\"DeleteOnTermination\":true,\"Description\":\"\",\"DeviceIndex\":0,\"Groups\":[\"sg-0ec24b8fa4b23c700\"],\"Ipv6AddressCount\":0,\"Ipv6Addresses\":[],\"NetworkInterfaceId\":\"eni-094e1ec04863821ae\",\"PrivateIpAddress\":\"172.31.36.129\",\"PrivateIpAddresses\":[{\"Primary\":true,\"PrivateIpAddress\":\"172.31.36.129\"}],\"SecondaryPrivateIpAddressCount\":0,\"SubnetId\":\"subnet-872f9bda\",\"InterfaceType\":\"interface\"}]",
        "Placement": "{\"AvailabilityZone\":\"us-east-1c\",\"GroupName\":\"\",\"Tenancy\":\"default\"}",
        "SecurityGroupIds": "[\"sg-0ec24b8fa4b23c700\"]",
        "SubnetId": "subnet-872f9bda",
        "VpcId": "vpc-87d09dff",
        "aws:backup:request-id": "e9908485-bb92-496e-b349-ade6e1fd2c4b"
    }
}
