using System;
using System.Globalization;

namespace Rhenium.Runtime.Handler
{
    public class DateHandler : IHandler
    {
        public object Random()
        {
            DateTime today = DateTime.UtcNow.Date;

            if ( R.NextBoolean() == true )
                return today.AddDays( +R.Next( 20 ) );
            else
                return today.AddDays( -R.Next( 20 ) );
        }


        public string ToJson( object value )
        {
            DateTime v = (DateTime) value;

            return v.ToString( "yyyy-MM-dd", CultureInfo.InvariantCulture );
        }
    }
}
