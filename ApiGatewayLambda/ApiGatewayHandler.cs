using Amazon.Lambda.APIGatewayEvents;
using Amazon.Lambda.Core;

[assembly: LambdaSerializer(typeof(Amazon.Lambda.Serialization.Json.JsonSerializer))]

namespace ApiGatewayLambda
{
    public class ApiGatewayHandler
    {
        public APIGatewayProxyResponse Handle() => new APIGatewayProxyResponse {
			Body = "The plain lambda function is working!",
			StatusCode = 200
		};
    }
}
