using System;

namespace Rhenium.Runtime.Handler
{
    public class BoolHandler : IHandler
    {
        public object Random()
        {
            return R.NextBoolean();
        }
    }
}
