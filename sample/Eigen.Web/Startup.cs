using Microsoft.Owin;
using Owin;
using Rhenium;

[assembly: OwinStartup( typeof( Eigen.Web.Startup ) )]

namespace Eigen.Web
{
    public class Startup
    {
        public void Configuration( IAppBuilder app )
        {
            app.UseRhenium();
        }
    }
}