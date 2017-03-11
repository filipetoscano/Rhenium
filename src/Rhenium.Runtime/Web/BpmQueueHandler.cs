using System;
using System.Web;

namespace Rhenium.Runtime.Web
{
    public class BpmQueueHandler : IHttpHandler
    {
        public void ProcessRequest( HttpContext context )
        {
            /*
             * 
             */
            string queueName = context.Request.AppRelativeCurrentExecutionFilePath.Substring( "~/queue/".Length )
                             + context.Request.PathInfo;

            if ( IsQueueDefined( queueName ) == false )
            {
                context.Response.StatusCode = 404;
                context.Response.End();
            }


            /*
             * 
             */
            string taskId = QueueGetTask( queueName );

            if ( taskId == null )
            {
                context.Response.StatusCode = 200;
                context.Response.Write( "Queue is empty." );
                context.Response.End();
            }


            /*
             * 
             */
            context.Response.Redirect( "~/task/" + taskId );
            context.Response.End();
        }


        private string QueueGetTask( string queueName )
        {
            return null;
        }


        private bool IsQueueDefined( string queueName )
        {
            return true;
        }


        public bool IsReusable
        {
            get { return true; }
        }
    }
}
