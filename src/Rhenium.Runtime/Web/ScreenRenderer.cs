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
        public void Render( HttpResponse response, ScreenDocument data )
        {
            #region Validations

            if ( response == null )
                throw new ArgumentNullException( nameof( response ) );

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
            XsltArgumentList args = new XsltArgumentList();

            response.StatusCode = 200;
            response.ContentType = "text/html";

            xslt.Transform( data.Screen.CreateNavigator(), args, response.OutputStream );
        }
    }
}
