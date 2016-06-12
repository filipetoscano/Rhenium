namespace Rhenium.Runtime.Handler
{
    public class StringHandler : IHandler
    {
        public object Random()
        {
            return "String #" + R.Next( 200 );
        }
    }
}
