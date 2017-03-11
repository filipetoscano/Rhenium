namespace Rhenium.Runtime.Handler
{
    public class IntegerHandler : IHandler
    {
        public object Random()
        {
            return R.Next( 200 );
        }


        public string ToJson( object value )
        {
            int v = (int) value;

            return v.ToString();
        }
    }
}
