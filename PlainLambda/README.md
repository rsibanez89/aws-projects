## Run this project
```
> Powershell.exe -File ./PlainLambda/deploy.ps1
```

## Do it yourself
### 1 - Create a project
```
> dotnet new classlib -n PlainLambda
```

### 2 - Make sure PlainLambda.csproj target framework is netcoreapp2.1, and it generates the runtime configuration file
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
> dotnet publish ./PlainLambda/PlainLambda.csproj
```

### 5 - Add everything into a zip file
```
> 7z a ./PlainLambda/bin/Debug/netcoreapp2.1/plain-lambda.zip ./PlainLambda/bin/Debug/netcoreapp2.1/publish/*
```

### 6 - Upload the zip file to the s3 bucket
```
> aws s3 cp ./PlainLambda/bin/Debug/netcoreapp2.1/plain-lambda.zip s3://rsibanez89
```

### 7 - Deploy the cloudformation with the lambda function
```
> aws cloudformation deploy --template-file 1_plain_lambda.yaml --stack-name plain-lambda --capabilities CAPABILITY_NAMED_IAM
```

### 8 - Test the lambda function
```
> aws lambda invoke --function-name plain-lambda lambda-response.json
```