# terraform-homework

1. Clone the working repository in your machine with the command : git clone <repository_url>

2. Initialize Terraform with the command : terraform init

3. Create folders that will be pushed to the repository you've already created: 

Files :  main.tf , sg.tf , variables.tf , etc 

4. Create a region.tfvars files. Provide all the required variables pretaining to that specific region tfvar's file, example: california.tfvars or ohio.tfvars

For the following file(s) : region.tfvars provide values inside of the quotes

region = ""    # provide region
ami_id = ""     # provide ami id
instance_type = ""     # provide instance type
availability_zone = ""     # provide availability zones
key_type = ""     # provide key type
instance_count = ""     # provide count

5. Deploy in that specific region using command : terraform apply -var-file california.tfvars or terraform apply -var-file ohio.tfvars

6. After you've deployed and it was successful, Destroy your region resources using the command : terraform destroy -var-file california.tfvars or terraform destroy -var-file ohio.tfvars

Or simply use the command : terrafom destroy to destory all region resources at the same time.

* Hope this helps:)