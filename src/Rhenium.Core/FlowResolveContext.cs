using System;
using System.Collections.Specialized;

namespace Rhenium
{
    public class FlowResolveContext
    {
        public Uri Url { get; set; }
        public NameValueCollection QueryString { get; set; }
        public NameValueCollection Form { get; set; }
    }
}
