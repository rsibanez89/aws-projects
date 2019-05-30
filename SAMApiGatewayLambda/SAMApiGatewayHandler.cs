using Amazon.Lambda.APIGatewayEvents;
using Amazon.Lambda.Core;

[assembly: LambdaSerializer(typeof(Amazon.Lambda.Serialization.Json.JsonSerializer))]

namespace SAMApiGatewayLambda
{
    public class SAMApiGatewayHandler
    {
        public APIGatewayProxyResponse Handle() => new APIGatewayProxyResponse {
			Body = "The plain lambda function is working!",
			StatusCode = 200
		};
    }
}
