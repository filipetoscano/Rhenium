using System;
using System.Collections.Generic;

namespace Rhenium.Runtime.Orchestrator.Persistence
{
    public class MssqlStore : ISessionStore
    {
        private Dictionary<Guid, ISession> _store = new Dictionary<Guid, ISession>();


        public MssqlStore()
        {
        }


        public ISession Load( Guid sessionId )
        {
            throw new NotImplementedException();
        }


        public void Save( ISession session )
        {
            #region Validations

            if ( session == null )
                throw new ArgumentNullException( nameof( session ) );

            #endregion

            throw new NotImplementedException();
        }
    }
}
