using System;
using System.Web;

namespace Rhenium.Runtime.Web
{
    public class FileRenderer : IRenderer<FileDocument>
    {
        public void Render( HttpResponse response, FileDocument data )
        {
            #region Validations

            if ( response == null )
                throw new ArgumentNullException( nameof( response ) );

            if ( data == null )
                throw new ArgumentNullException( nameof( data ) );

            #endregion

            response.StatusCode = 200;
            response.ContentType = "application/octet-stream";
            response.Headers.Add( "Content-Disposition", "attachment; filename=" + data.Name );

            response.BinaryWrite( data.Content );
        }
    }
}
