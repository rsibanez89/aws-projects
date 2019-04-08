# On local environment run > Powershell.exe -File ./PlainLambda/deploy.ps1
aws cloudformation delete-stack --stack-name plain-lambda

dotnet clean ./PlainLambda/PlainLambda.csproj
dotnet publish ./PlainLambda/PlainLambda.csproj

7z a ./PlainLambda/bin/Debug/netcoreapp2.1/plain-lambda.zip ./PlainLambda/bin/Debug/netcoreapp2.1/publish/*

aws s3 cp ./PlainLambda/bin/Debug/netcoreapp2.1/plain-lambda.zip s3://rsibanez89

# Don't do this in production!
Write-Host "Waiting 5 seconds for the stack to be deleted."
Start-Sleep -Seconds 5

aws cloudformation deploy --template-file 1_plain_lambda.yaml --stack-name plain-lambda --capabilities CAPABILITY_NAMED_IAM

# Testing
aws lambda invoke --function-name plain-lambda lambda-response.json