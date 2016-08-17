using CefSharp;
using CefSharp.WinForms;
using System.IO;
using System.Windows.Forms;

namespace Rhenium.VisualStudio
{
    /// <summary>
    /// Editor Control.
    /// </summary>
    public class EditorControl : Panel
    {
        private ChromiumWebBrowser _browser;
        private BrowserApplication _app;

        /// <summary>
        /// Explicitly defined default constructor.
        /// Initialize new instance of the EditorControl.
        /// </summary>
        public EditorControl()
        {
            InitializeComponent();


            /*
             * 
             */
            if ( Cef.IsInitialized == false )
                Cef.Initialize( new CefSettings(), shutdownOnProcessExit: false, performDependencyCheck: true );


            /*
             * 
             */
            _browser = new ChromiumWebBrowser( "file:///C:/Work/Transition/Rhenium/src/Rhenium.Modeller/index.html" )
            {
                Dock = DockStyle.Fill,
            };

            this.Controls.Add( _browser );


            /*
             * 
             */
            _app = new BrowserApplication( _browser );

            _app.Ready += ( sender, args ) =>
            {
                _app.Load( _app.Model );
            };
        }


        public BrowserApplication Application
        {
            get { return _app; }
        }



        public void LoadFile( string filename )
        {
            string content = File.ReadAllText( filename );

            if ( _app.IsReady == true )
                _app.Load( _app.Model );
            else
                _app.Model = content;
        }



        public void SaveFile( string filename )
        {
            File.WriteAllText( filename, _app.Model );
        }


        private new void Dispose()
        {
            base.Dispose();

            _app.Dispose();
            _browser.Dispose();

            // TODO: How do we shutdown embedded CEF?
            //Cef.Shutdown();
        }


        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
        }
    }
}
