<p align="center"> <img src="https://user-images.githubusercontent.com/50652676/62349836-882fef80-b51e-11e9-99e3-7b974309c7e3.png" width="100" height="100"></p>


<h1 align="center">
    Terraform AWS VPC
</h1>

<p align="center" style="font-size: 1.2rem;"> 
    Terraform module to create VPC resource on AWS.
     </p>

<p align="center">

<a href="https://www.terraform.io">
  <img src="https://img.shields.io/badge/Terraform-v0.13-green" alt="Terraform">
</a>
<a href="LICENSE.md">
  <img src="https://img.shields.io/badge/License-MIT-blue.svg" alt="Licence">
</a>


</p>
<p align="center">

<a href='https://facebook.com/sharer/sharer.php?u=https://github.com/devops4mecode/terraform-aws-vpc'>
  <img title="Share on Facebook" src="https://user-images.githubusercontent.com/50652676/62817743-4f64cb80-bb59-11e9-90c7-b057252ded50.png" />
</a>
<a href='https://www.linkedin.com/shareArticle?mini=true&title=Terraform+AWS+VPC&url=https://github.com/devops4mecode/terraform-aws-vpc'>
  <img title="Share on LinkedIn" src="https://user-images.githubusercontent.com/50652676/62817742-4e339e80-bb59-11e9-87b9-a1f68cae1049.png" />
</a>
<a href='https://twitter.com/intent/tweet/?text=Terraform+AWS+VPC&url=https://github.com/devops4mecode/terraform-aws-vpc'>
  <img title="Share on Twitter" src="https://user-images.githubusercontent.com/50652676/62817740-4c69db00-bb59-11e9-8a79-3580fbbf6d5c.png" />
</a>

</p>
<hr>

## Prerequisites

This module has a few dependencies: 

- [Terraform 0.13](https://learn.hashicorp.com/terraform/getting-started/install.html)
- [Go](https://golang.org/doc/install)
- [github.com/stretchr/testify/assert](https://github.com/stretchr/testify)
- [github.com/gruntwork-io/terratest/modules/terraform](https://github.com/gruntwork-io/terratest)

## Examples


**IMPORTANT:** Since the `master` branch used in `source` varies based on new modifications, we suggest that you use the release versions [here](https://github.com/devops4mecode/terraform-aws-vpc/releases).


### Simple Example
Here is an example of how you can use this module in your inventory structure:
  ```hcl
  module "vpc" {
      source      = "devpops4mecode/vpc/aws"
      version     = "1.1.0"
      name        = "vpc"
      application = "devops4me"
      environment = "test"
      label_order = ["environment", "name", "application"]
      cidr_block  = "10.0.0.0/16"
    }
  ```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| application | Application (e.g. `do4m` or `devops4me`). | `string` | `""` | no |
| attributes | Additional attributes (e.g. `1`). | `list` | `[]` | no |
| cidr\_block | CIDR for the VPC. | `string` | `""` | no |
| enable\_classiclink | A boolean flag to enable/disable ClassicLink for the VPC. | `bool` | `false` | no |
| enable\_classiclink\_dns\_support | A boolean flag to enable/disable ClassicLink DNS Support for the VPC. | `bool` | `false` | no |
| enable\_dns\_hostnames | A boolean flag to enable/disable DNS hostnames in the VPC. | `bool` | `true` | no |
| enable\_dns\_support | A boolean flag to enable/disable DNS support in the VPC. | `bool` | `true` | no |
| enable\_flow\_log | Enable vpc\_flow\_log logs. | `bool` | `false` | no |
| environment | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `""` | no |
| instance\_tenancy | A tenancy option for instances launched into the VPC. | `string` | `"default"` | no |
| label\_order | Label order, e.g. `name`,`application`. | `list` | `[]` | no |
| managedby | ManagedBy, eg 'DevOps4Me' or 'NajibRadzuan'. | `string` | `"najibradzuan@devops4me.com"` | no |
| name | Name  (e.g. `app` or `cluster`). | `string` | `""` | no |
| s3\_bucket\_arn | S3 ARN for vpc logs. | `string` | `""` | no |
| tags | Additional tags (e.g. map(`BusinessUnit`,`XYZ`). | `map` | `{}` | no |
| traffic\_type | Type of traffic to capture. Valid values: ACCEPT,REJECT, ALL. | `string` | `"ALL"` | no |
| vpc\_enabled | Flag to control the vpc creation. | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| igw\_id | The ID of the Internet Gateway. |
| ipv6\_cidr\_block | The IPv6 CIDR block. |
| tags | A mapping of tags to assign to the resource. |
| vpc\_cidr\_block | The CIDR block of the VPC. |
| vpc\_default\_network\_acl\_id | The ID of the network ACL created by default on VPC creation. |
| vpc\_default\_route\_table\_id | The ID of the route table created by default on VPC creation. |
| vpc\_default\_security\_group\_id | The ID of the security group created by default on VPC creation. |
| vpc\_id | The ID of the VPC. |
| vpc\_ipv6\_association\_id | The association ID for the IPv6 CIDR block. |
| vpc\_main\_route\_table\_id | The ID of the main route table associated with this VPC. |




## Testing
In this module testing is performed with [terratest](https://github.com/gruntwork-io/terratest) and it creates a small piece of infrastructure, matches the output like ARN, ID and Tags name etc and destroy infrastructure in your AWS account. This testing is written in GO, so you need a [GO environment](https://golang.org/doc/install) in your system. 

You need to run the following command in the testing folder:
```hcl
  go test -run Test
```