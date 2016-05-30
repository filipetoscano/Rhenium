using System;

namespace Rhenium.Runtime.Story
{
    public class BusinessNode : INode
    {
        public IEvent Execute( NodeContext context )
        {
            return new NamedEvent( "success" );
        }
    }
}
