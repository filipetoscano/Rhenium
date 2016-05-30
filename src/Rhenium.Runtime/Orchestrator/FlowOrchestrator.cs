using Rhenium.Runtime.Orchestrator.Persistence;
using System;
using Activator = Platinum.Activator;

namespace Rhenium.Runtime.Orchestrator
{
    public class FlowOrchestrator
    {
        private ISessionStore _store;

        public FlowOrchestrator()
        {
            _store = new MemoryStore();
        }


        public IEvent Start( string flowCode, IEvent @event )
        {
            #region Validations

            if ( flowCode == null )
                throw new ArgumentNullException( nameof( flowCode ) );

            if ( @event == null )
                throw new ArgumentNullException( nameof( @event ) );

            #endregion

            Flow flow = Flow.Load( flowCode );

            FlowSession session = new FlowSession();
            session.Id = Guid.NewGuid();
            session.FlowCode = flow.Code;

            IEvent result = ProcessLoop( flow, session, null, @event );

            _store.Save( session );

            return result;
        }


        public IEvent Process( Guid sessionId, string nodeId, IEvent @event )
        {
            #region Validations

            if ( nodeId == null )
                throw new ArgumentNullException( nameof( nodeId ) );

            if ( @event == null )
                throw new ArgumentNullException( nameof( @event ) );

            #endregion

            ISession session = _store.Load( sessionId );
            Flow flow = Flow.Load( session.FlowCode );

            IEvent result = ProcessLoop( flow, session, null, @event );

            _store.Save( session );

            return result;
        }


        public IEvent ProcessLoop( Flow flow, ISession session, string nodeId, IEvent @event )
        {
            IEvent result;
            string iterId = nodeId;

            do
            {
                FlowNode to = flow.Transition( iterId, @event.Name );

                INode node = Activator.Create<INode>( to.Moniker );
                result = node.Execute( null );

                iterId = to.Id;
            } while ( result.Name != null );

            return result;
        }
    }
}
