namespace Rhenium
{
    public interface IEvent
    {
        string Name { get; }
        object Data { get; }
    }
}
