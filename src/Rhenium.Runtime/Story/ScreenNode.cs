using System;

namespace Rhenium.Runtime.Story
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
