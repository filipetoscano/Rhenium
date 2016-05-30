using System;

namespace Rhenium.Runtime.Orchestrator
{
    public class FlowSession : ISession
    {
        public Guid Id
        {
            get;
            set;
        }


        public string FlowCode
        {
            get;
            set;
        }


        public object Content
        {
            get;
            set;
        }
    }
}
