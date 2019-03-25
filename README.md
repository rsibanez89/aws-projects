# aws-projects
Amazon Web Services example projects.

### 1 - Install and configure AWS CLI
```
> aws configure
AWS Access Key ID [None]: AAAAAAAAAAAAAAAAAA <- Replace with your Access Key
AWS Secret Access Key [None]: 5BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBJ <- Replace with your Secret Access Key
Default region name [None]: us-east-2
Default output format [None]: json
```

### 2 - Create the bucket to store the source code of the lambda functions.
```
> aws cloudformation deploy --template-file 0_deployment_bucket.yaml --stack-name rsibanez89-deployment-bucket
```

### 3 - Build the solution
```
> dotnet publish ./PlainLambda/PlainLambda.sln
```

### 4 - Add everything into a zip file (install 7-zip, and add it to the path environment: https://www.7-zip.org/)
```
> 7z a ./PlainLambda/PlainLambda/bin/Debug/netcoreapp2.1/plain-lambda.zip ./PlainLambda/PlainLambda/bin/Debug/netcoreapp2.1/publish/*
```

### 5 - Upload the zip file to the s3 bucket
```
> aws s3 cp ./PlainLambda/PlainLambda/bin/Debug/netcoreapp2.1/plain-lambda.zip s3://rsibanez89
```

### 6 - Deploy the cloudformation with the lambda function
```
> aws cloudformation deploy --template-file 1_plain_lambda.yaml --stack-name plain-lambda --capabilities CAPABILITY_NAMED_IAM
```

### 7 - Test the lambda function
```
> aws lambda invoke --function-name plain-lambda lambda-response.json
```

### 8 - [NOT REQUIRED] Delete the cloudformation in order to deploy it again. Just if you want to edit the the code in the lambda function
```
> aws cloudformation delete-stack --stack-name plain-lambda
```