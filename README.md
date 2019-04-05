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

#### 1 - Plain Lambda [LINK](../PlainLambda)
The most basic lambda function you can create in .net core.

#### 2 - Api Gateway Lambda [LINK](../ApiGatewayLambda)
A basic lambda function that is triggered by API Gateway.