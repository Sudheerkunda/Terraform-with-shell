#!/bin/bash
while getopts ":A:B:C:D:E:F:" opt; do
case $opt in
A) echo "You choose 'A' "; Region="$OPTARG";;
B) echo "You choose 'B' "; vpc_name="$OPTARG";;
C) echo "You choose 'C' "; vpc_cidr="$OPTARG";;
D) echo "You choose 'D' "; subnet_name="$OPTARG";;
E) echo "You choose 'E' "; subnet_cidr="$OPTARG";;
F) echo "You choose 'F' "; availability_zone="$OPTARG";;
esac
done
echo "$Region"
echo "$vpc_name"
echo "$vpc_cidr"
echo "$subnet_name"
echo "$subnet_cidr"
echo "$availability_zone"
#terraform init
#terraform validate
#validate_status=$?
#if [ "$validate_status" != 0 ]
#then
#exit
#else
terraform apply --auto-approve -var 'aws_region='"$Region" -var 'vpc_name='"$vpc_name" -var 'vpc_cidr='"$vpc_cidr" -var 'subnet_name="$subnet_name" -var 'subnet_cidr='"$subnet_cidr" -var 'availability_zone='"$availability_zone"
#fi  
