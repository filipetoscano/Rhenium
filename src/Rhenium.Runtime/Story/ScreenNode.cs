using Platinum.Resolver;
using Rhenium.Runtime.Handler;
using System;
using System.Collections.Generic;
using System.Dynamic;
using System.Linq;
using System.IO;
using System.Xml.Linq;

namespace Rhenium.Runtime.Story
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


            /*
             * 
             */
            Dictionary<string, IHandler> Handlers = new Dictionary<string, IHandler>();
            //handlers.Add( "s:list/s:option/@d:options" )

            Handlers.Add( "s:bool/@d:value", new BoolHandler() );
            Handlers.Add( "s:date/@d:value", new DateHandler() );
            Handlers.Add( "s:int/@d:value", new IntegerHandler() );
            Handlers.Add( "s:string/@d:value", new StringHandler() );

            Handlers.Add( "@d:input", new TrueHandler() );



            /*
             * 
             */
            var manager = NamespaceManager.Instance;
            Dictionary<string, IHandler> handlers = new Dictionary<string, IHandler>();

            foreach ( XAttribute attr in doc.Screen.Select<XAttribute>( " //@d:value ", manager ) )
            {
                string bindPath = attr.Value;

                if ( bindPath.StartsWith( "$" ) == true )
                {
                }

                if ( bindPath == null )
                    continue;

                if ( handlers.ContainsKey( bindPath ) == true )
                    continue;

                string expr0 = "@d:" + attr.Name.LocalName;
                string expr1 = manager.LookupPrefix( attr.Parent.Name.NamespaceName ) + ":" + attr.Parent.Name.LocalName + "/" + expr0;
                string expr2 = manager.LookupPrefix( attr.Parent.Parent.Name.NamespaceName ) + ":" + attr.Parent.Parent.Name.LocalName + "/" + expr1;

                IHandler h = null;

                if ( h == null )
                    h = Handlers.FirstOrDefault( x => x.Key == expr2 ).Value;

                if ( h == null )
                    h = Handlers.FirstOrDefault( x => x.Key == expr1 ).Value;

                if ( h == null )
                    h = Handlers.FirstOrDefault( x => x.Key == expr0 ).Value;

                if ( h == null )
                    continue;

                handlers.Add( bindPath, h );
            }
            


            /*
             * 
             */
            IDictionary<string, object> data = new ExpandoObject();

            foreach ( var h in handlers )
            {
                data[ h.Key ] = h.Value.Random();
            }

            doc.Data = data;


            /*
             * 
             */
            return doc;
        }
    }
}
