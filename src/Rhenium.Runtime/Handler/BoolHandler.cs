using System;

namespace Rhenium.Runtime.Handler
{
    public class BoolHandler : IHandler
    {
        public object Random()
        {
            return R.NextBoolean();
        }


        public string ToJson( object value )
        {
            bool b = (bool) value;

            return b ? "true" : "false";
        }
    }
}
