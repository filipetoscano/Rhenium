using System;

namespace Rhenium.Runtime.Node
{
    public class ScreenNode : INode
    {
        public IEvent Execute( NodeContext context )
        {
            ScreenDocument doc = new ScreenDocument();

            return doc;
        }
    }
}
