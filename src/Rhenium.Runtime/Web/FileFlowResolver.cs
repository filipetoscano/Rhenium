using System;

namespace Rhenium.Runtime.Web
{
    public class FileFlowResolver : IFlowResolver
    {
        public FlowResolveResult Resolve( FlowResolveContext context )
        {
            #region Validations

            if ( context == null )
                throw new ArgumentNullException( nameof( context ) );

            #endregion

            return new FlowResolveResult
            {
                FlowCode = "MA001",
                StartEvent = new NamedEvent( "start" )
            };
        }
    }
}
