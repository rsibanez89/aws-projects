# Amazon Web Services example projects.

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

### 3 - Check each solution

#### 1 - Plain Lambda [LINK](./PlainLambda/README.md)
The most basic lambda function you can create in .net core.

#### 2 - Api Gateway Lambda [LINK](./ApiGatewayLambda/README.md)
A basic lambda function that is triggered by API Gateway.

#### 3 - SAM Api Gateway Lambda [LINK](./SAMApiGatewayLambda/README.md)
A basic lambda function that is triggered by API Gateway by using AWS Serverless Application Model (SAM) instead of plain CloudFormation templates.

### 4 - EC2 Example
Login to the console and create a new KeyPair: https://console.aws.amazon.com/ec2/home?region=us-east-1#KeyPairs
```
> aws cloudformation deploy --template-file 4_ec2.yaml --stack-name rod-ec2-example --parameter-overrides KeyName=rsibanez89-ec2 
> aws cloudformation describe-stacks --stack-name rod-ec2-example
> ssh -i rsibanez89-ec2.pem ec2-user@ec2-3-19-221-234.us-east-2.compute.amazonaws.com
```

