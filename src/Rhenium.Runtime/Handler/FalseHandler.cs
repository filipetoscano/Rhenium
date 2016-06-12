namespace Rhenium.Runtime.Handler
{
    public class FalseHandler : IHandler
    {
        public object Random()
        {
            return false;
        }
    }
}
