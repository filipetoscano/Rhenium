using CefSharp.WinForms;
using System;

namespace Rhenium.VisualStudio
{
    public class BrowserApplication : IDisposable
    {
        private ChromiumWebBrowser _browser;


        public BrowserApplication( ChromiumWebBrowser browser )
        {
            _browser = browser;
            _browser.RegisterJsObject( "iface", this, false );
        }


        private bool _isReady;
        private string _navigateToElement;
        private string _model;


        /// <summary>
        /// Gets or sets whether the browser application is ready.
        /// </summary>
        public bool IsReady
        {
            get { return _isReady; }

            set
            {
                _isReady = value;

                if ( this.Ready != null )
                    this.Ready( this, new EventArgs<bool>( this._isReady ) );
            }
        }


        /// <summary>
        /// Gets or sets the model/data of the application.
        /// </summary>
        public string Model
        {
            get { return _model; }

            set
            {
                _model = value;

                if ( ModelChanged != null )
                    this.ModelChanged( this, new EventArgs<string>( this._model ) );
            }
        }


        /// <summary>
        /// Gets the element that Visual Studio should navigate to.
        /// </summary>
        public string NavigateToElement
        {
            get { return _navigateToElement; }

            set
            {
                _navigateToElement = value;

                if ( NavigateTo != null )
                    this.NavigateTo( this, new EventArgs<string>( this._navigateToElement ) );
            }
        }


        /// <summary>
        /// Loads the model into the browser application.
        /// </summary>
        /// <param name="model">Model data.</param>
        public void Load( string model )
        {
            _model = model;
            _browser.GetBrowser().MainFrame.ExecuteJavaScriptAsync( "(function(){ modelLoad(); })();" );
        }


        public void Dispose()
        {
            _browser = null;
        }


        public event EventHandler<EventArgs<bool>> Ready;
        public event EventHandler<EventArgs<string>> ModelChanged;
        public event EventHandler<EventArgs<string>> NavigateTo;
    }



    public class EventArgs<T> : EventArgs
    {
        public T Parameter { get; private set; }

        public EventArgs( T input )
        {
            Parameter = input;
        }
    }

}
