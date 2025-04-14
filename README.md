# Multi-customer Terraform Repo

This repo demonstrates a multi-customer, multi-region Terraform set-up with reusable modules.

## [Customers](customers)

Each customer is represented by a directory inside the [customers](customers). Inside each customer directory is another directory for each AWS account. `dev` contains non-production environments in a single AWS account. `prod` contains the production environment of a single AWS account.

Environments within each account use a dedicated Terraform workspace.

To deploy an environment:

```bash
cd multi_client_terraform/customers/<customer>/<account>/<environment>
terraform workspace new <environment> # if workspace does not exist
terraform workspace select <environment>
terraform plan/apply -var-file=variables.tfvars
```

## [Modules](modules)

This directory contains the reusable module code.
Changes to these modules will affect ALL uses of the module.
