using System;

namespace Rhenium.Runtime.Web
{
    public class FileRenderer : IRenderer<FileDocument>
    {
        public void Render( object context, FileDocument data )
        {
            #region Validations

            if ( context == null )
                throw new ArgumentNullException( nameof( context ) );

            if ( data == null )
                throw new ArgumentNullException( nameof( data ) );

            #endregion

            // context.Response.StatusCode = 200;
            // context.Response.ContentType = "application/octet-stream";
            // context.Response.Headers.Add( "Content-Disposition", "attachment; filename=" + data.Name );

            // context.Response.BinaryWrite( data.Content );
        }
    }
}
