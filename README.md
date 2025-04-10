# Multi-customer Terraform Repo

This repo demonstrates a multi-customer Terraform set-up with reusable modules.

## [Customers](customers)

Each customer is represented by a directory inside the [customers](customers). Inside each customer directory is another directory for each AWS account. `dev` contains non-production environments in a single AWS account. `prod` contains the production environment of a single AWS account.

## [Modules](modules)

This directory contains the reusable module code. This to reduce code repetition and to minimise drift between similar uses of the resources.
