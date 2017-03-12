namespace Rhenium
{
    public interface IRenderer
    {
    }

    public interface IRenderer<T> : IRenderer
    {
        //void Render( HttpContext context, T data );
    }
}
