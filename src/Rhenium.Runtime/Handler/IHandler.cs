namespace Rhenium.Runtime.Handler
{
    interface IHandler
    {
        object Random();

        string ToJson( object value );
    }
}
