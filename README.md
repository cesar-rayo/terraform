# TERRAFORM

Initialize the environment (this will download the required plugins)
```
$ terraform init
```

Validate templates
```
$ terraform validate
Success! The configuration is valid.
```

Deploy templates
```
$ terraform plan -var-file dev.tfvars
$ terraform apply -var-file dev.tfvars
```

Avoiding confirmation
```
$ terraform apply -var-file dev.tfvars -auto-approve
```

Use the `backend` to store the status of the deployed infrastructure, centralizing the status of the deployment, consider using encrypt.

If `backend` is not defined, the status will be stored in local folders, usually at `.terraform`