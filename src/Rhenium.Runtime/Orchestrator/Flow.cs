using System;
using System.Collections.Generic;

namespace Rhenium.Runtime.Orchestrator
{
    public class Flow
    {
        internal Flow( string code )
        {
            #region Validations

            if ( code == null )
                throw new ArgumentNullException( nameof( code ) );

            #endregion

            this.Code = code;
        }


        public string Code
        {
            get;
            private set;
        }


        public FlowNode Transition( string fromNodeId, string eventName )
        {
            #region Validations

            if ( eventName == null )
                throw new ArgumentNullException( nameof( eventName ) );

            #endregion

            if ( fromNodeId == null || fromNodeId == "bb" )
            {
                return new FlowNode()
                {
                    Id = "aa",
                    NodeId = "MA001_N001",
                    Moniker = "Rhenium.Runtime.Story.BusinessNode,Rhenium.Runtime",
                    Settings = new Dictionary<string, string>()
                };
            }
            else
            {
                return new FlowNode()
                {
                    Id = "bb",
                    NodeId = "MA001_N001",
                    Moniker = "Rhenium.Runtime.Story.ScreenNode,Rhenium.Runtime",
                    Settings = new Dictionary<string, string>()
                };
            }
        }



        public static Flow Load( string code )
        {
            #region Validations

            if ( code == null )
                throw new ArgumentNullException( nameof( code ) );

            #endregion

            return new Flow( code );
        }
    }
}
