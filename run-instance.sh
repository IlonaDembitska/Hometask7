aws ec2 run-instances \
    --image-id ami-053b0d53c279acc90 \
    --count 1 \
    --instance-type t3.micro \
    --key-name IXT \
    --security-group-ids sg-0e5e429188f2557a6 \
    --subnet-id subnet-0a3b23777a3c62388 \
    --user-data file://userdata.sh \
    --output text
