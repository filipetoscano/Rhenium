using Owin;
using Rhenium.Owin;
using System;

namespace Rhenium
{
    public static class Extensions
    {
        public static void UseRhenium( this IAppBuilder app )
        {
            #region Validations

            if ( app == null )
                throw new ArgumentNullException( nameof( app ) );

            #endregion

            app.Use( typeof( RheniumMiddleware ) );
        }
    }
}
