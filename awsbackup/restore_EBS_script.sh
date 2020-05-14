set -x
uuid=$(uuidgen)
aws backup start-restore-job \
--recovery-point-arn arn:aws:ec2:us-west-2::snapshot/snap-019e61bbd5d298660 \
--metadata file:///Users/rahulgaitonde/aws/awsbackup/test2.json \
--iam-role-arn arn:aws:iam::154204971707:role/service-role/AWSBackupDefaultServiceRole \
--idempotency-token $uuid \
--region us-west-2
