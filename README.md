# internal-tool-sample
A new Azure-based internal tool.

# Setup
> NB: This is for deploying from a local PC for testing purposes. Future versions of the internal tool will handle Azure authentication and deployment of Azure resources. These instructions are still useful to confirm a valid Terraform configuration against the 'azurerm' Terrform provider.

First, sign into Azure with the 'az' tool, specifying, if necessary, the Azure Tenant ID and the associated Subscription ID:
``` bash
az login --tenant <TenantID>
```


Create a '.env' environment variables file with the following contents:
``` bash
export ARM_CLIENT_ID=<ClientID>
export ARM_CLIENT_SECRET=<ClientSecret>
export ARM_SUBSCRIPTION_ID=<SubscriptionID>
export ARM_TENANT_ID=<TenantID>
```

And then run `source .env` to set your Azure credentials and secrets to your local environment.

This will 

Run terraform plan with the Terraform variables file to confirm that the deployment is valid against Azure resources.
```
terraform plan -var-file="terraform.tfvars"
```
