namespace Rhenium.Runtime.Handler
{
    public class FalseHandler : IHandler
    {
        public object Random()
        {
            return false;
        }


        public string ToJson( object value )
        {
            return "false";
        }
    }
}
