using Platinum.Resolver;
using System;
using System.Web;
using System.Xml;
using System.Xml.Xsl;
using System.Xml.XPath;

namespace Rhenium.Runtime.Web
{
    public class ScreenRenderer : IRenderer<ScreenDocument>
    {
        public void Render( HttpContext context, ScreenDocument data )
        {
            #region Validations

            if ( context == null )
                throw new ArgumentNullException( nameof( context ) );

            if ( data == null )
                throw new ArgumentNullException( nameof( data ) );

            #endregion


            /*
             * 
             */
            UrlResolver r = new UrlResolver( true );

            XslCompiledTransform xslt = new XslCompiledTransform();

            XmlReaderSettings xrs = new XmlReaderSettings();
            xrs.XmlResolver = r;

            XsltSettings xs = new XsltSettings();
            xs.EnableDocumentFunction = true;
            xs.EnableScript = true;

            using ( XmlReader xr = XmlReader.Create( "re://UI/style/main.xslt", xrs ) )
            {
                xslt.Load( xr, xs, r );
            }


            /*
             * 
             */
            string appPath = ToApplicationPath( context.Request );


            /*
             * 
             */
            UrlResolver r2 = new UrlResolver();

            string ns = NS.R.NamespaceName;

            XsltArgumentList args = new XsltArgumentList();
            args.AddParam( "ApplicationPath", ns, appPath );

            context.Response.StatusCode = 200;
            context.Response.ContentType = "text/html";

            XmlWriterSettings xws = xslt.OutputSettings.Clone();
            xws.Indent = false;

            using ( XmlWriter xw = XmlWriter.Create( context.Response.OutputStream, xws ) )
            {
                xslt.Transform( data.Screen.CreateNavigator(), args, xw, r2 );
            }
        }


        private static string ToApplicationPath( HttpRequest request )
        {
            if ( request.ApplicationPath.EndsWith( "/", StringComparison.Ordinal ) == true )
                return request.ApplicationPath;
            else
                return request.ApplicationPath + "/";
        }
    }
}
