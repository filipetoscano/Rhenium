using Platinum.Resolver;
using System;
using System.IO;
using System.Xml.Linq;

namespace Rhenium.Runtime.Node
{
    public class ScreenNode : INode
    {
        public IEvent Execute( NodeContext context )
        {
            /*
             * 
             */
            string uri = "re://MA/MA001/N002.xml";

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
                throw;
            }

            if ( stream == null )
            {
                //throw;
            }

            
            /*
             *
             */
            ScreenDocument doc = new ScreenDocument();
            doc.Screen = XDocument.Load( stream );
            stream.Dispose();

            return doc;
        }
    }
}
