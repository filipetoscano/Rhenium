﻿using Microsoft.VisualStudio.Shell;
using System;
using System.Diagnostics;
using System.Globalization;
using System.Runtime.InteropServices;

namespace Rhenium.VisualStudio
{
    /// <summary>
    /// This class implements Visual studio package that is registered within Visual Studio IDE.
    /// The EditorPackage class uses a number of registration attribute to specify integration parameters.
    /// </summary>
    /// <remarks>
    /// <para>A description of the different attributes used here is given below:</para>
    /// <para>PackageRegistration: Used to determine if the package registration tool should look for additional 
    ///                      attributes. We currently specify that the package commands are described in a 
    ///                      managed package and not in a separate satellite UI binary.</para>
    /// <para>ProvideMenuResource: Provides information about menu resources. 
    ///     We specify ResourceId=1000 and version=1.</para>
    /// <para>ProvideEditorLogicalView: Indicates that our editor supports LOGVIEWID_Designer logical view and 
    ///     registers EditorFactory class to manage this view.</para>
    /// <para>ProvideEditorExtension: With this attribute we register our AddNewItem Templates 
    ///     for specified project types.</para>
    /// </remarks>
    [PackageRegistration( UseManagedResourcesOnly = true )]
    [InstalledProductRegistration( "#100", "#102", "10.0", IconResourceID = 400 )]
    // We register our AddNewItem Templates the Miscellaneous Files Project:
    [ProvideEditorExtension( typeof( EditorFactory ), ".ref", 32, ProjectGuid = "{A2FE74E1-B743-11d0-AE1A-00A0C90FFFC3}", TemplateDir = "Templates", NameResourceID = 106 )]
    // We register that our editor supports LOGVIEWID_Designer logical view
    [ProvideEditorLogicalView( typeof( EditorFactory ), "{7651a703-06e5-11d1-8ebd-00a0c90f26ea}" )]
    [Guid( GuidStrings.GuidClientPackage )]
    public class EditorPackage : Package, IDisposable
    {
        private EditorFactory editorFactory;


        /// <summary>
        /// Initializes new instance of the EditorPackage.
        /// </summary>
        public EditorPackage()
        {
        }


        /// <summary>
        /// Create EditorPackage context.
        /// </summary>
        protected override void Initialize()
        {
            //Create Editor Factory
            base.Initialize();
            editorFactory = new EditorFactory();
            RegisterEditorFactory( editorFactory );
        }


        /// <summary>
        /// Releases the resources used by the Package object.
        /// </summary>
        public void Dispose()
        {
            Dispose( true );
        }


        /// <summary>
        /// Releases the resources used by the Package object.
        /// </summary>
        /// <param name="disposing">This parameter determines whether the method has been called directly or indirectly by a user's code.</param>
        protected override void Dispose( bool disposing )
        {
            try
            {
                Debug.WriteLine( string.Format( CultureInfo.CurrentCulture, "Entering Dispose() of: {0}", ToString() ) );
                if ( disposing )
                {
                    if ( editorFactory != null )
                    {
                        editorFactory.Dispose();
                        editorFactory = null;
                    }
                    GC.SuppressFinalize( this );
                }
            }
            finally
            {
                base.Dispose( disposing );
            }
        }
    }
}
