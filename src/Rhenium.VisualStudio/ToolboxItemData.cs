using System;
using System.Runtime.Serialization;

namespace Rhenium.VisualStudio
{
    /// <summary>
    /// This class implements data to be stored in ToolboxItem.
    /// This class needs to be serializable in order to be passed to the toolbox
    /// and back.
    /// 
    /// Moreover, this assembly path is required to be on VS probing paths to make
    /// deserialization successful. See ToolboxItemData.pkgdef.
    /// </summary>
    [Serializable]
    public class ToolboxItemData : ISerializable
    {
        private string content;

        /// <summary>
        /// Overloaded constructor.
        /// </summary>
        /// <param name="sentence">Sentence value.</param>
        public ToolboxItemData( string sentence )
        {
            content = sentence;
        }


        /// <summary>
        /// Gets the ToolboxItemData Content.
        /// </summary>
        public string Content
        {
            get { return content; }
        }


        internal ToolboxItemData( SerializationInfo info, StreamingContext context )
        {
            content = info.GetValue( "Content", typeof( string ) ) as string;
        }


        void ISerializable.GetObjectData( SerializationInfo info, StreamingContext context )
        {
            if ( info != null )
            {
                info.AddValue( "Content", Content );
            }
        }
    }
}
