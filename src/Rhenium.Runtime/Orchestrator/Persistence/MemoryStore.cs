using System;
using System.Collections.Generic;

namespace Rhenium.Runtime.Orchestrator.Persistence
{
    public class MemoryStore : ISessionStore
    {
        private Dictionary<Guid, ISession> _store = new Dictionary<Guid, ISession>();


        public MemoryStore()
        {
        }


        public ISession Load( Guid sessionId )
        {
            return _store[ sessionId ];
        }


        public void Save( ISession session )
        {
            #region Validations

            if ( session == null )
                throw new ArgumentNullException( nameof( session ) );

            #endregion

            lock ( _store )
            {
                _store[ session.Id ] = session;
            }
        }
    }
}
