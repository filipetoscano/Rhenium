using System.Xml.Linq;

namespace Rhenium.Runtime
{
    public sealed class ScreenDocument : IEvent
    {
        public ScreenDocument()
        {
        }


        public XDocument Screen
        {
            get;
            set;
        }


        public object Data
        {
            get;
            set;
        }


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
