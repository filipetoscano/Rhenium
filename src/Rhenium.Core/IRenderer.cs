using System.Web;

namespace Rhenium
{
    public interface IRenderer
    {
    }

    public interface IRenderer<T> : IRenderer
    {
        void Render( HttpResponse response, T data );
    }
}
