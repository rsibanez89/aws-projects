using Amazon.Lambda.APIGatewayEvents;
using Amazon.Lambda.Core;
using System.Collections.Generic;

[assembly: LambdaSerializer(typeof(Amazon.Lambda.Serialization.Json.JsonSerializer))]

namespace SAMApiGatewayLambda
{
	public class SAMApiGatewayHandler
	{
		public APIGatewayProxyResponse Handle() => new APIGatewayProxyResponse
		{
			Body = "The plain lambda function is working!",
			StatusCode = 200,
			Headers = new Dictionary<string, string>
			{
				{ "Content-Type", "application/json" },
				{ "Access-Control-Allow-Origin", "*" }
			}
		};
	}
}
