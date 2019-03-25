using Amazon.Lambda.Core;

[assembly: LambdaSerializer(typeof(Amazon.Lambda.Serialization.Json.JsonSerializer))]

namespace PlainLambda
{
    public class ApiGatewayLambdaHandler
    {
        public ApiGatewayResponse Handle()
        {
            return new ApiGatewayResponse
            {
                Body = "My first plain lambda",
                StatusCode = 200
            };
        }
    }

    public class ApiGatewayResponse
    {
        public string Body { get; set; }
        public int StatusCode { get; set; }
    }
}
