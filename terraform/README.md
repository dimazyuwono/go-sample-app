## Terraform
```
Note :
- Terraform will look up a ~/.kube/config file where it's already populated with credentials. Make sure you do have the file.
- The state file is stored in local.
``` 

The directory is populated with terraform codes. It is using Terraform 0.12 conventions. The terraform will create a `Deployment` resource to Kubernetes cluster and a `Service` resource where it will assign a LoadBalancer to the Deployment. After `terraform apply` it will show the public IP of the `LoadBalancer` resource.

### Providers

| Name | Version |
|------|---------|
| kubernetes | 2.0.1 |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| replicas | Mandatory values that defines how many replicas / pods in the `Deployment` resource. | `number` | `1` | yes |
| service\_version | Mandatory string to define the service tag for the `Deployment` resource . | `string` | `latest` | yes |


### Outputs

| Name | Description |
|------|-------------|
| lb_ip | The public IP of the `Service`'s LoadBalancer resource. |

### How-to execute
```
terraform init
terraform apply ( uses default values )
OR
terraform init
terraform apply -var replicas=[number of replica] -var service_verson=[container image tag]
```

### References
- [Terraform - Kubernetes Provider](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/guides/getting-started#provider-setup)
- [Terraform - Kubernetes Deployment](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/deployment)
- [Terraform - Kubernetes Service](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service)