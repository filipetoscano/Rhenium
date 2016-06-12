using System.Xml;

namespace Rhenium.Runtime
{
    public static class NamespaceManager
    {
        public static XmlNamespaceManager Instance
        {
            get
            {
                XmlNamespaceManager manager = new XmlNamespaceManager( new NameTable() );
                manager.AddNamespace( "r", NS.Rhenium.NamespaceName );
                manager.AddNamespace( "f", NS.Flow.NamespaceName );
                manager.AddNamespace( "s", NS.Screen.NamespaceName );
                manager.AddNamespace( "d", NS.Data.NamespaceName );
                manager.AddNamespace( "h", NS.DataHint.NamespaceName );
                manager.AddNamespace( "l", NS.Locale.NamespaceName );
                manager.AddNamespace( "v", NS.Validation.NamespaceName );

                /*
                 * Add custom namespaces
                 */
                

                return manager;
            }
        }
    }
}
