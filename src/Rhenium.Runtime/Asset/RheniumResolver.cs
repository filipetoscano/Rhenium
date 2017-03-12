using Platinum.Resolver;
using System;
using System.IO;

namespace Rhenium.Runtime.Asset
{
    public class RheniumResolver : IUrlResolver
    {
        private string _applicationPath;


        public RheniumResolver( string applicationPath )
        {
            #region Validations

            if ( applicationPath == null )
                throw new ArgumentNullException( nameof( applicationPath ) );

            #endregion

            _applicationPath = applicationPath;
        }


        public Uri ResolveUri( Uri baseUri, string relativeUri )
        {
            #region Validations

            if ( relativeUri == null )
                throw new ArgumentNullException( nameof( relativeUri ) );

            #endregion

            Uri theUri = new Uri( relativeUri );

            ResolverConfiguration config = ResolverConfiguration.Current;
            ResolverSource sconfig = config.SourceFor( theUri.Host );

            if ( config.ResolveUsing == ResolverMethod.FileSystem )
            {
                string p1 = Path.Combine( null, sconfig.Directory ); //HttpContext.Current.Request.PhysicalApplicationPath, sconfig.Directory );
                string p2 = Path.Combine( p1, "." + theUri.AbsolutePath.Replace( '/', Path.DirectorySeparatorChar ) );

                return new Uri( p2, UriKind.Absolute );
            }
            else
            {
                return new Uri( "assembly:///" + sconfig.Assembly + "/~/" + theUri.AbsolutePath );
            }
        }
    }
}
