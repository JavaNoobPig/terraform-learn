### Demo project accompanying a [Consul crash course video](https://www.youtube.com/watch?v=s3I1kKKfjtQ) on YouTube

#Original Repo:
https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqbHdVU01nbVVvMkFNSEpURUxzYnQydkVWRUtkd3xBQ3Jtc0trc2wyUFlnQ1o5VW5pNjB3c05qZDhRNVgxVGZVcWk0WHlMZDdiTDBfUTZwU3FqZ2RRVlhsM3BaUjZoNF94MFFhWnpSb0hRRVB4YnpEYm9mZjBMMmJUVGcyVEQ3TmE3OXhBbWZMWk5rMmc1akdzcmZIQQ&q=https%3A%2F%2Fgitlab.com%2Ftwn-youtube%2Fconsul-crash-course&v=s3I1kKKfjtQ

#Original Vid:
https://youtu.be/s3I1kKKfjtQ?si=1eGRwff-5XamJsHc

Terraform commands to execute the script

```sh
# initialise project & download providers
terraform init

# preview what will be created with apply & see if any errors
terraform plan

# exeucute with preview
terraform apply -var-file terraform.tfvars

# execute without preview
terraform apply -var-file terraform.tfvars -auto-approve

# destroy everything
terraform destroy

# show resources and components from current state
terraform state list
```

#### Get access to EKS cluster
```sh
# install and configure awscli with access creds
aws configure

# check existing clusters list
aws eks list-clusters --region eu-central-1 --output table --query 'clusters'

# check config of specific cluster - VPC config shows whether public access enabled on cluster API endpoint
aws eks describe-cluster --region eu-central-1 --name myapp-eks-cluster --query 'cluster.resourcesVpcConfig'

# create kubeconfig file for cluster in ~/.kube
aws eks update-kubeconfig --region eu-central-1 --name myapp-eks-cluster

# test configuration
kubectl get svc
```
