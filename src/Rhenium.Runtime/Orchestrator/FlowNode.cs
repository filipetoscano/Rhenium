using System.Collections.Generic;

namespace Rhenium.Runtime.Orchestrator
{
    public class FlowNode
    {
        public string Id { get; set; }

        public string NodeId { get; set; }

        public string Moniker { get; set; }

        public Dictionary<string,string> Settings { get; set; }
    }
}
