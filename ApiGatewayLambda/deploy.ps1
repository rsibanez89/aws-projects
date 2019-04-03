# On local environment run > Powershell.exe -File ./ApiGatewayLambda/deploy.ps1
dotnet clean ./ApiGatewayLambda/ApiGatewayLambda.csproj
dotnet publish ./ApiGatewayLambda/ApiGatewayLambda.csproj

7z a ./ApiGatewayLambda/bin/Debug/netcoreapp2.1/api-gateway-lambda.zip ./ApiGatewayLambda/bin/Debug/netcoreapp2.1/publish/*

aws s3 cp ./ApiGatewayLambda/bin/Debug/netcoreapp2.1/api-gateway-lambda.zip s3://rsibanez89

aws cloudformation delete-stack --stack-name api-gateway-lambda

Write-Host "Waiting 5 seconds for the stack to be deleted."
Start-Sleep -Seconds 5

aws cloudformation deploy --template-file 2_api_gateway_lambda.yaml --stack-name api-gateway-lambda --capabilities CAPABILITY_NAMED_IAM

# Testing
aws lambda invoke --function-name api-gateway-lambda lambda-response.json