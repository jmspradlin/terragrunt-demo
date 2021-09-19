# terragrunt-demo
Basic demo of Terragrunt using Azure storage and resource groups

# Overview
This lab demonstrates using Terragrunt against a single module with two resource creations (storage account and resource group)

# Features
This lab uses the following folder structure for deploying *n*-count storage accounts and resource groups based on environment variables passed in from Terragrunt config files
```
terragrunt-lab
|- modules
|  |- storage.tf
|- prod
|  |- terragrunt.hcl
|- stage
|  |- terragrunt.hcl
```

All variables for storage are defaulted, except for `env` and `account_replication_type` in order to demonstrate environment naming and storage tiering in lower level and upper level environments. Terragrunt config for these settings are 'stage' and 'prod' for environment and 'ZRS' and 'RAGRS' for the storage replication type.

# Running the demo
To use this lab, you will need Terraform and Terragrunt installed.

### Log in with your Azure credentials and set subscription

```
az login
```

This will open a new browser window or tab for login to Azure. 

Once authenticated, run 
```
az account set -s <subscription-ID>
``` 

to select specific subscription for resource creation if you are authorized for multiple subscriptions.

### Deploying with Terragrunt

**NOTE: Make sure to destroy all resources in all environments when complete to prevent incurring additional costs**

**Stage Environment:** From the root of this repo, run:

```
cd stage
terragrunt apply --auto-approve
```

Once complete, destroy all resources by running:

```
terragrunt destroy --auto-approve
```

**Production Environment:** From the root of this repo, run:

```
cd prod
terragrunt apply --auto-approve
```

Once complete, destroy all resources by running:

```
terragrunt destroy --auto-approve
```


# Dependencies

In order to deploy this lab, you will need Terraform and Terragrunt installed locally.