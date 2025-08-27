# internal-tool-sample
A new Azure-based internal tool.

# Setup
> NB: This is for deploying from a local PC for testing purposes. Future versions of the internal tool will handle Azure authentication and deployment of Azure resources. These instructions are still useful to confirm a valid Terraform configuration against the 'azurerm' Terrform provider.

First, sign into Azure with the 'az' tool, specifying, if necessary, the Azure Tenant ID and select the appropriate Subscription ID making a note of both:
``` bash
az login --tenant <TenantID>
```

If you are unaware of your Tenant ID and/or you do not have an existing service principal, create one as follows (though you must know the subscription ID):

```
az ad sp create-for-rbac \
  --name "sp-terraform-internal-app" \
  --role "Contributor" \
  --scopes "/subscriptions/<your-subscription-id>"
```


Create a '.env' environment variables file with the following contents:
``` bash
export ARM_CLIENT_ID=<ClientID>
export ARM_CLIENT_SECRET=<ClientSecret>
export ARM_SUBSCRIPTION_ID=<SubscriptionID>
export ARM_TENANT_ID=<TenantID>
```

And then run `source .env` to set your Azure credentials and secrets to your local environment.

Run terraform plan with the Terraform variables file to confirm that the deployment is valid against Azure resources.
```
terraform plan -var-file="terraform.tfvars"
```

From there, you can apply the Terraform configuration.

# Next Steps

- Setup remote backend to store Terraform state
- Create Service Principal for a CI/CD pipeline (e.g. GitHub Actions) to be able to run Terraform plan, and use RBAC to only allow resource creation on the subscription from this Service Principal.
- Create a separate pipeline to delete resources using the Service Prinicpal
- Add Application Insights
- Add monitoring for cost controls to view expenditure and any long-running resources if the internal tool is intended for time-limited experiments rather than production deployment