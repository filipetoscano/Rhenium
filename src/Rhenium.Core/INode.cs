namespace Rhenium
{
    public interface INode
    {
        IEvent Execute( NodeContext context );
    }
}
