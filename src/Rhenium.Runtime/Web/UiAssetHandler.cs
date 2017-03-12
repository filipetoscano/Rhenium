using Platinum.Resolver;
using System;
using System.IO;

namespace Rhenium.Runtime.Web
{
    public class UiAssetHandler //: IHttpHandler
    {
        public bool IsReusable
        {
            get { return true; }
        }


        public void ProcessRequest( object context )
        {
            ///*
            // * 
            // */
            //string extension = GetExtension( context.Request );

            //if ( IsAllowedExtension( extension ) == false )
            //{
            //    context.Response.StatusCode = 404;
            //    context.Response.End();
            //    return;
            //}


            ///*
            // * 
            // */
            //string uri = string.Concat(
            //    "re://",
            //    context.Request.AppRelativeCurrentExecutionFilePath.Substring( 6 ),
            //    context.Request.PathInfo );

            //UrlResolver res = new UrlResolver();
            //Uri theUri = res.ResolveUri( null, uri );

            
            ///*
            // * 
            // */
            //Stream stream;

            //try
            //{
            //    stream = res.GetEntity( theUri );
            //}
            //catch ( FileNotFoundException )
            //{
            //    context.Response.StatusCode = 404;
            //    context.Response.End();
            //    return;
            //}

            //if ( stream == null )
            //{
            //    context.Response.StatusCode = 404;
            //    context.Response.End();
            //    return;
            //}


            ///*
            // * 
            // */
            //if ( extension == ".woff2" )
            //    extension = ".woff";

            //context.Response.StatusCode = 200;
            //context.Response.ContentType = MimeTypes.List[ extension.Substring( 1 ) ];

            //stream.CopyTo( context.Response.OutputStream );
            //stream.Flush();
            //stream.Dispose();
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

            if ( extension == ".woff" )
                return true;

            if ( extension == ".woff2" )
                return true;

            return false;
        }


        private string GetExtension( object request )
        {
            throw new NotImplementedException();
            // int ix = request.PathInfo.LastIndexOf( '.' );
            // return request.PathInfo.Substring( ix );
        }
    }
}
