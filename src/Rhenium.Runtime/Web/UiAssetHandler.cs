using Platinum.Resolver;
using Platinum.Web;
using System;
using System.IO;
using System.Web;

namespace Rhenium.Runtime.Web
{
    public class UiAssetHandler : IHttpHandler
    {
        public bool IsReusable
        {
            get { return true; }
        }


        public void ProcessRequest( HttpContext context )
        {
            /*
             * 
             */
            string extension = GetExtension( context.Request );

            if ( IsAllowedExtension( extension ) == false )
            {
                context.Response.StatusCode = 404;
                context.Response.End();
                return;
            }


            /*
             * 
             */
            string uri = string.Concat(
                "re://",
                context.Request.AppRelativeCurrentExecutionFilePath.Substring( 6 ),
                context.Request.PathInfo );

            UrlResolver res = new UrlResolver();
            Uri theUri = res.ResolveUri( null, uri );

            
            /*
             * 
             */
            Stream stream;

            try
            {
                stream = res.GetEntity( theUri );
            }
            catch ( FileNotFoundException )
            {
                context.Response.StatusCode = 404;
                context.Response.End();
                return;
            }

            if ( stream == null )
            {
                context.Response.StatusCode = 404;
                context.Response.End();
                return;
            }

            string content;

            using ( StreamReader sr = new StreamReader( stream ) )
            {
                content = sr.ReadToEnd();
            }


            /*
             * 
             */
            context.Response.StatusCode = 200;
            context.Response.ContentType = MimeTypes.List[ extension.Substring( 1 ) ];
            context.Response.Write( content );
        }


        private bool IsAllowedExtension( string extension )
        {
            if ( extension == ".js" )
                return true;

            if ( extension == ".css" )
                return true;

            if ( extension == ".map" )
                return true;

            if ( extension == ".jpg" )
                return true;

            if ( extension == ".png" )
                return true;

            if ( extension == ".ttf" )
                return true;

            return false;
        }


        private string GetExtension( HttpRequest request )
        {
            int ix = request.PathInfo.LastIndexOf( '.' );
            return request.PathInfo.Substring( ix );
        }
    }
}
