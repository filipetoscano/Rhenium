using Rhenium.Runtime.Orchestrator;
using System;
using System.Web;

namespace Rhenium.Runtime.Web
{
    public class FlowHandler : IHttpHandler
    {
        public bool IsReusable
        {
            get { return true; }
        }


        public void ProcessRequest( HttpContext context )
        {
            bool start = true;
            IEvent result;


            /*
             * 
             */
            if ( start == true )
            {
                IFlowResolver resolver = new FileFlowResolver();

                FlowResolveContext ctx = new FlowResolveContext();
                ctx.Url = context.Request.Url;
                ctx.QueryString = context.Request.QueryString;
                ctx.Form = context.Request.Form;

                var flow = resolver.Resolve( ctx );

                var orq = new FlowOrchestrator();
                result = orq.Start( flow.FlowCode, flow.StartEvent );
            }
            else
            {
                Guid sessionId = Guid.Parse( context.Request.Form[ "ReSessionId" ] );
                string nodeId = (string) context.Request.Form[ "ReNodeId" ];
                IEvent triggerEvent = new NamedEvent( "continue" );

                var orq = new FlowOrchestrator();
                result = orq.Process( sessionId, nodeId, triggerEvent );
            }


            /*
             * 
             */
            IRenderer<ScreenDocument> renderer = new ScreenRenderer();
            renderer.Render( context, (ScreenDocument) result);
        }
    }
}
