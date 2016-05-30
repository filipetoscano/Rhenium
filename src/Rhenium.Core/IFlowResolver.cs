namespace Rhenium
{
    public interface IFlowResolver
    {
        FlowResolveResult Resolve( FlowResolveContext context );
    }
}
