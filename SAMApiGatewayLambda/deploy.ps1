# On local environment run > Powershell.exe -File ./SAMApiGatewayLambda/deploy.ps1
dotnet clean ./SAMApiGatewayLambda/SAMApiGatewayLambda.csproj
dotnet publish ./SAMApiGatewayLambda/SAMApiGatewayLambda.csproj

sam package --template-file 3_sam_api_gateway_lambda.yaml --output-template 3_sam_api_gateway_lambda_output.yaml --s3-bucket rsibanez89

sam deploy --template-file 3_sam_api_gateway_lambda_output.yaml --stack-name sam-api-gateway-lambda --capabilities CAPABILITY_NAMED_IAM

aws cloudformation deploy --template-file E:\sources\aws-projects\3_sam_api_gateway_lambda_output.yaml --stack-name sam-test --capabilities CAPABILITY_NAMED_IAM

del 3_sam_api_gateway_lambda_output.yaml

# Testing
#aws lambda invoke --function-name api-gateway-lambda lambda-response.json