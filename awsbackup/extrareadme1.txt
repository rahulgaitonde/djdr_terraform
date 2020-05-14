aws backup create-backup-plan \
--backup-plan "{\"BackupPlanName\":\"Rahul-Test-Backup-Plan\",\"Rules\":[{\"RuleName\":\"DailyBackups\",\"ScheduleExpression\":\"cron(0 5 ? * * *)\",\"StartWindowMinutes\":480,\"TargetBackupVaultName\":\"Default\",\"Lifecycle\":{\"DeleteAfterDays\":35}}]}"

aws backup get-backup-plan \
--backup-plan-id "1a749ebf-eb44-4df6-8b6c-36f8cfda14d0"

aws backup describe-recovery-point \
--backup-vault-name Default \
--recovery-point-arn arn:aws:ec2:us-west-2::image/ami-04555b9b3720fcb7f


#How to restore the AMI in aws backup fault in oregon region 
aws backup start-restore-job \
--recovery-point-arn arn:aws:ec2:us-west-2::image/ami-04555b9b3720fcb7f \
--metadata ARN=arn:aws:ec2:us-west-2::image/ami-04555b9b3720fcb7f \
--iam-role-arn arn:aws:iam::154204971707:role/service-role/AWSBackupDefaultServiceRole


 aws backup get-recovery-point-restore-metadata \
--backup-vault-name Default \
--recovery-point-arn arn:aws:ec2:us-west-2::image/ami-04555b9b3720fcb7f \
--region us-west-2


{
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
        "aws:backup:request-id": "7ac9f761-50dc-4fa7-a801-0440c618f41e"
    }
}










"NetworkInterfaces": "[{\"AssociatePublicIpAddress\":true,\"DeleteOnTermination\":true,\"Description\":\"\",\"DeviceIndex\":0,\"Groups\":[\"sg-52b43f1b\"],\"Ipv6AddressCount\":0,\"Ipv6Addresses\":[],\"NetworkInterfaceId\":\"eni-094e1ec04863821ae\",\"PrivateIpAddress\":\"172.31.36.129\",\"PrivateIpAddresses\":[{\"Primary\":true,\"PrivateIpAddress\":\"172.31.36.129\"}],\"SecondaryPrivateIpAddressCount\":0,\"SubnetId\":\"subnet-1c566365\",\"InterfaceType\":\"interface\"}]",
"Placement": "{\"AvailabilityZone\":\"us-west-2b\",\"GroupName\":\"\",\"Tenancy\":\"default\"}",












{
    "BackupPlanId": "1a749ebf-eb44-4df6-8b6c-36f8cfda14d0",
    "BackupPlanArn": "arn:aws:backup:us-east-1:154204971707:backup-plan:1a749ebf-eb44-4df6-8b6c-36f8cfda14d0",
    "CreationDate": 1586199241.036,
    "VersionId": "NzU5MzUyMmMtMThkZS00YjEwLTk3YWMtZTQ4OTg3MGNlZDU4"
}