## Run this project
```
> Powershell.exe -File ./PlainLambda/deploy.ps1
```

## Do it yourself
### 1 - Create a project
```
> dotnet new classlib -n SAMApiGatewayLambda
```

### 2 - Make sure SAMApiGatewayLambda.csproj target framework is netcoreapp2.1, and it generates the runtime configuration file
```
<PropertyGroup>
  <TargetFramework>netcoreapp2.1</TargetFramework>
  <GenerateRuntimeConfigurationFiles>true</GenerateRuntimeConfigurationFiles>
</PropertyGroup>
```

### 3 - I added a global.json file to build the project by using dotnet 2 configuration as my default is dotnet 3.
```
{
  "sdk": {
    "version": "2.1.504"
  }
}
```

### 4 - Build the project
```
> dotnet publish ./SAMApiGatewayLambda/SAMApiGatewayLambda.csproj
```

### 5 - Create a sample request to test the lambda function
```
> sam local generate-event api > testSAMApiGatewayLambdaRequest.json
```

### 6 - Test the lambda function
```
> sam local invoke --template 3_sam_api_gateway_lambda.yaml --event testSAMApiGatewayLambdaRequest.json
```

### 7 - Test the API Gateway
```
> sam local start-api --template 3_sam_api_gateway_lambda.yaml
```

### 8 - Upload the code to s3
```
> sam package --template-file 3_sam_api_gateway_lambda.yaml --output-template 3_sam_api_gateway_lambda.yaml --s3-bucket rsibanez89
```

### 9 - Deploy
```
> sam deploy --template-file 3_sam_api_gateway_lambda.yaml --stack-name sam-api-gateway-lambda --capabilities CAPABILITY_NAMED_IAM
```

### 10 - Test deployed function
```
> aws lambda invoke --function-name sam-api-gateway-lambda lambda-response.json
```