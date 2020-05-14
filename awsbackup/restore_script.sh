set -x
uuid=$(uuidgen)
aws backup start-restore-job \
--recovery-point-arn arn:aws:ec2:us-west-2::image/ami-097df3c796b05420f \
--metadata file:///Users/rahulgaitonde/aws/awsbackup/test.json \
--iam-role-arn arn:aws:iam::154204971707:role/service-role/AWSBackupDefaultServiceRole \
--idempotency-token $uuid \
--resource-type EC2 --region us-west-2
