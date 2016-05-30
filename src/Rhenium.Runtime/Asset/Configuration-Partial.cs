using System;
using System.Linq;

namespace Rhenium.Runtime.Asset
{
    public partial class ResolverConfiguration
    {
        public ResolverSource SourceFor( string name )
        {
            #region Validations

            if ( name == null )
                throw new ArgumentNullException( nameof( name ) );

            #endregion

            string theName = name.ToLowerInvariant();
            return this.Sources.FirstOrDefault( x => x.Name.ToLowerInvariant() == theName );
        }
    }
}
