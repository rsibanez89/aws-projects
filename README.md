# aws-projects
Amazon Web Services example projects.

## 1 - Install and configure AWS CLI
```
> aws configure
AWS Access Key ID [None]: AAAAAAAAAAAAAAAAAA
AWS Secret Access Key [None]: 5BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBJ
Default region name [None]: us-east-2
Default output format [None]: json
```

## 2 - Create the bucket to store the source code of the lambda functions.
> aws cloudformation deploy --template-file 0_deployment_bucket.yaml --stack-name rsibanez89-deployment-bucket