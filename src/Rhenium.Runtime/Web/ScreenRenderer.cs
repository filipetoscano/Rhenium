using Platinum.Resolver;
using System;
using System.Xml;
using System.Xml.Xsl;
using System.Xml.XPath;
using Platinum.Configuration;
using Newtonsoft.Json;

namespace Rhenium.Runtime.Web
{
    public class ScreenRenderer //: IRenderer<ScreenDocument>
    {
        public void Render( object context, ScreenDocument screen )
        {
            #region Validations

            if ( context == null )
                throw new ArgumentNullException( nameof( context ) );

            if ( screen == null )
                throw new ArgumentNullException( nameof( screen ) );

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
            string jsonData = JsonConvert.SerializeObject( screen.Data );


            /*
             * 
             */
            //string appPath = ToApplicationPath( context.Request );


            ///*
            // * 
            // */
            //UrlResolver r2 = new UrlResolver();

            //string ns = NS.R.NamespaceName;

            //XsltArgumentList args = new XsltArgumentList();
            //args.AddParam( "ApplicationPath", ns, appPath );
            //args.AddParam( "ScreenData", NS.D.NamespaceName, jsonData );

            //context.Response.StatusCode = 200;
            //context.Response.ContentType = "text/html";

            //XmlWriterSettings xws = xslt.OutputSettings.Clone();
            //xws.Indent = AppConfiguration.Get<bool>( "XsltIndent" );

            //using ( XmlWriter xw = XmlWriter.Create( context.Response.OutputStream, xws ) )
            //{
            //    xslt.Transform( screen.Screen.CreateNavigator(), args, xw, r2 );
            //}
        }


        //private static string ToApplicationPath( HttpRequest request )
        //{
        //    if ( request.ApplicationPath.EndsWith( "/", StringComparison.Ordinal ) == true )
        //        return request.ApplicationPath;
        //    else
        //        return request.ApplicationPath + "/";
        //}
    }
}
