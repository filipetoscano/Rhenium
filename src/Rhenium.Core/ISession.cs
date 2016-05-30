using System;

namespace Rhenium
{
    public interface ISession
    {
        Guid Id { get; }

        string FlowCode { get; }

        object Content { get; set; }
    }
}
