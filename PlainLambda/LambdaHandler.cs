using Amazon.Lambda.Core;

[assembly: LambdaSerializer(typeof(Amazon.Lambda.Serialization.Json.JsonSerializer))]

namespace PlainLambda
{
    public class LambdaHandler
    {
        public string Handle() => "The plain lambda function is working!";
    }
}
