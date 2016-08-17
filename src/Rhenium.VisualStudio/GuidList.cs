using System;

namespace Rhenium.VisualStudio
{
    /// <summary>
    /// This class contains a list of GUIDs specific to this sample, 
    /// especially the package GUID and the commands group GUID. 
    /// </summary>
    public static class GuidStrings
    {
        public const string GuidClientPackage = "68a4ede6-8f63-44f2-803e-65f770e709e1";
        public const string GuidClientCmdSet = "2513aa39-e57d-47d5-b6d1-a09061e103d7";
        public const string GuidEditorFactory = "93fa4dc3-61ec-47af-b0ba-50cad3caf049";
    }

    /// <summary>
    /// List of the GUID objects.
    /// </summary>
    internal static class GuidList
    {
        public static readonly Guid guidEditorCmdSet = new Guid( GuidStrings.GuidClientCmdSet );
        public static readonly Guid guidEditorFactory = new Guid( GuidStrings.GuidEditorFactory );
    };
}