### 1 - Create a project
```
> dotnet new classlib -n ApiGatewayLambda -f netcoreapp2.1
```

### 2 - Build the project
```
> dotnet publish ./ApiGatewayLambda/ApiGatewayLambda.csproj
```

### 3 - Add everything into a zip file
```
> 7z a ./ApiGatewayLambda/bin/Debug/netcoreapp2.1/api-gateway-lambda.zip ./ApiGatewayLambda/bin/Debug/netcoreapp2.1/publish/*
```

### 5 - Upload the zip file to the s3 bucket
```
> aws s3 cp ./ApiGatewayLambda/bin/Debug/netcoreapp2.1/api-gateway-lambda.zip s3://rsibanez89
```

### 6 - Deploy the cloudformation with the lambda function
```
> aws cloudformation deploy --template-file 2_api_gateway_lambda.yaml --stack-name api-gateway-lambda --capabilities CAPABILITY_NAMED_IAM
```

### 7 - Test the lambda function
```
> aws lambda invoke --function-name api-gateway-lambda lambda-response.json
```