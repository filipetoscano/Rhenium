using Microsoft.Owin;
using System;
using System.Threading.Tasks;

namespace Rhenium.Owin
{
    public class RheniumMiddleware : OwinMiddleware
    {
        public RheniumMiddleware( OwinMiddleware next )
            : base( next )
        {
        }


        public override Task Invoke( IOwinContext context )
        {
            #region Validations

            if ( context == null )
                throw new ArgumentNullException( nameof( context ) );

            #endregion

            context.Response.StatusCode = 200;
            context.Response.Write( "hello" );

            return Task.CompletedTask;
            // await Next.Invoke( context );
        }
    }
}
