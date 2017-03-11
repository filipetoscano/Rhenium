namespace Rhenium.Runtime.Handler
{
    public class TrueHandler : IHandler
    {
        public object Random()
        {
            return true;
        }


        public string ToJson( object value )
        {
            return "true";
        }
    }
}
