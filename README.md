# terraform-frontend

## Project setup
```
npm install
```

### Compiles and hot-reloads for development
```
npm run serve
```

### Compiles and minifies for production
```
npm run build
```

### Lints and fixes files
```
npm run lint
```

### Customize configuration
See [Configuration Reference](https://cli.vuejs.org/config/).


### Github Actions AWS Creds
In github repo -> settings -> "secrets and variables" -> Environment secrets
Add keys AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY and their values for AWS account.

### Github Actions Workflow
Create main.yml file in .github/workflows folder and add steps to run terraform, add configuration to trigger the workflow in the same file either on branch push or tag push.


### Terraform Setup
Add steps for terraform setup, initialization, apply and destroy in  .github/workflows/main.yml file.

### Terraform File Setup
Create variable.tf, provider.tf and files for all the services that will be used i.e. s3-bucket.tf, cloudfront.tf, codebuild.tf, codepipeline.tf and support files for policy, role creation for the same i.e. codebuild-pipeline-policy.tf, codebuildrole.tf.

### Codebuild Script
Create a buildspec.yml file to run build commands and copy the dist file to s3 bucket.


### Trigger and Monitor Workflow
The terraform script (Workflow) can be initiated using git push branch-name (branch-name is to be added in the .github/workflows/main.yml file).
The build can be monitored in github -> repository -> Actions