using Rhenium.Runtime.Orchestrator;
using System;
using System.Web;

namespace Rhenium.Runtime.Web
{
    public class BpmFlowHandler : IHttpHandler
    {
        public void ProcessRequest( HttpContext context )
        {
            bool start = true;
            IEvent result;


            /*
             * 
             */
            if ( context.Request.HttpMethod == "POST" && context.Request.Form[ "ReSessionId" ] != null )
                start = false;


            /*
             * 
             */
            if ( start == true )
            {
                var ctx = new FlowResolveContext();
                ctx.Url = context.Request.Url;
                ctx.QueryString = context.Request.QueryString;
                ctx.Form = context.Request.Form;

                IFlowResolver resolver = new FileFlowResolver();
                var flow = resolver.Resolve( ctx );

                var orq = new FlowOrchestrator();
                result = orq.Start( flow.FlowCode, flow.StartEvent );
            }
            else
            {
                Guid sessionId = Guid.Parse( context.Request.Form[ "ReSessionId" ] );
                string nodeId = context.Request.Form[ "ReNodeId" ];
                string eventName = context.Request.Form[ "ReEventName" ];

                IEvent triggerEvent = new NamedEvent( eventName );

                var orq = new FlowOrchestrator();
                result = orq.Process( sessionId, nodeId, triggerEvent );
            }


            /*
             * 
             */
            IRenderer<ScreenDocument> renderer = new ScreenRenderer();
            renderer.Render( context, (ScreenDocument) result );
        }


        public bool IsReusable
        {
            get { return true; }
        }
    }
}
