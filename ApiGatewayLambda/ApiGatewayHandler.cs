using Amazon.Lambda.Core;

[assembly: LambdaSerializer(typeof(Amazon.Lambda.Serialization.Json.JsonSerializer))]

namespace ApiGatewayLambda
{
    public class ApiGatewayHandler
    {
        public string Handle() => "The plain lambda function is working!";
    }
}
