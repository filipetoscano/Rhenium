using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Rhenium
{
    public class NamedEvent : IEvent
    {
        public NamedEvent( string name )
        {
            this.Name = name;
        }


        public string Name
        {
            get;
            set;
        }


        public object Data
        {
            get;
            set;
        }
    }
}
