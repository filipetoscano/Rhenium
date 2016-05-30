using System;

namespace Rhenium
{
    public interface ISessionStore
    {
        ISession Load( Guid sessionId );

        void Save( ISession session );
    }
}
