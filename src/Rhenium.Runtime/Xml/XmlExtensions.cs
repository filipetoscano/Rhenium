using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Xml;
using System.Xml.Linq;
using System.Xml.XPath;

namespace Rhenium.Runtime
{
    public static class XmlExtensions
    {
        public static IEnumerable<T> Select<T>( this XDocument document, string expression, IXmlNamespaceResolver resolver )
        {
            var enumerable = (IEnumerable) document.XPathEvaluate( expression, resolver );
            return enumerable.Cast<T>();
        }
    }
}
