using System;

namespace Rhenium.Runtime.Node
{
    public abstract class BaseNode : INode
    {
        public IEvent Execute( NodeContext context )
        {
            return new NamedEvent( "success" );
        }
    }
}
