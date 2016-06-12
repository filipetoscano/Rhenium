namespace Rhenium.Runtime.Handler
{
    public class IntegerHandler : IHandler
    {
        public object Random()
        {
            return R.Next( 200 );
        }
    }
}
