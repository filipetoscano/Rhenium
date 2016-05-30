using System;

namespace Rhenium.Runtime
{
    public sealed class FileDocument : IEvent
    {
        public string Name { get; set; }

        public byte[] Content { get; set; }

        string IEvent.Name
        {
            get { return null; }
        }

        object IEvent.Data
        {
            get { return this; }
        }
    }
}
