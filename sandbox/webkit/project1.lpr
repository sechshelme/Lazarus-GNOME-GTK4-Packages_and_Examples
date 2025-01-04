program project1;

uses
  ctypes,

  WebKit,                                 // io.
  WebKitWebViewBase,                      // io.
  WebKitURIRequest,                       // io.
  WebKitNavigationAction,                 // io. -> WebKitURIRequest
  WebKitScriptDialog,                     // io.
  WebKitPermissionRequest,                // io.
  WebKitWebsitePolicies,                  // io.
  WebKitPolicyDecision,                   // io. -> WebKitWebsitePolicies
  WebKitHitTestResult,                    // io.
  WebKitPrintOperation,                   // io.
  WebKitURIResponse,                      // io.
  WebKitWebResource,                      // io. -> WebKitURIResponse
  WebKitFileChooserRequest,               // io.
  WebKitContextMenuActions,               // io.
  WebKitContextMenuItem,                  // io. -> WebKitContextMenuActions
  WebKitContextMenu,                      // io. -> WebKitContextMenuItem
  WebKitSecurityOrigin,                   // io.
  WebKitFormSubmissionRequest,            // io.
  WebKitCredential,                       // io.
  WebKitNotification,                     // io.
  WebKitAuthenticationRequest,            // io. -> WebKitCredential, WebKitSecurityOrigin
  WebKitOptionMenuItem,                   // io.
  WebKitOptionMenu,                       // io. -> WebKitOptionMenuItem
  WebKitColorChooserRequest,              // io.
  WebKitUserMessage,                      // io.
  WebKitPermissionStateQuery,             // io. -> WebKitSecurityOrigin
  WebKitApplicationInfo,                  // io.
  WebKitCookieManager,                    // io.
  WebKitAutomationSession,                // io. -> WebKitApplicationInfo
  WebKitWebsiteData,                      // io.
  WebKitFaviconDatabase,                  // io.
  WebKitWebsiteDataManager,               // io. -> WebKitFaviconDatabase, WebKitWebsiteData
  WebKitNetworkProxySettings,             // io.
  WebKitMemoryPressureSettings,           // io.
  WebKitDownload,                         // io. -> WebKitURIRequest, WebKitURIResponse
  WebKitNetworkSession,                   // io. -> WebKitWebsiteDataManager, WebKitCookieManager, WebKitNetworkProxySettings, WebKitMemoryPressureSettings, WebKitDownload
  WebKitURISchemeResponse,                // io.
  WebKitURISchemeRequest,                 // io. -> WebKitURISchemeResponse
  WebKitGeolocationManager,               // io.
  WebKitSecurityManager,                  // io.
  WebKitWebContext,                       // io. -> WebKitURISchemeRequest, WebKitNetworkSession, WebKitGeolocationManager, WebKitSecurityManager, WebKitUserMessage
  WebKitBackForwardListItem,              // io.
  WebKitBackForwardList,                  // io. -> WebKitBackForwardListItem
  WebKitFeature,                          // io.
  WebKitSettings,                         // io. -> WebKitFeature
  WebKitWindowProperties,                 // io.
  WebKitFindController,                   // io.
  WebKitWebInspector,                     // io.
  WebKitUserContent,                      // io.
  WebKitUserContentManager,               // io. -> WebKitUserContent
  WebKitEditorState,                      // io.
  WebKitWebViewSessionState,              // io.
  WebKitInputMethodContext,               // io.
  WebKitWebView,                          // io. -> ( fast der ganze Rest )
  WebKitEnumTypes,                        // io.
  WebKitError,                            // io.
  WebKitUserContentFilterStore,           // io.
  WebKitWebFormManager,                   // io.
  WebKitWebEditor,                        // io.
  WebKitScriptWorld,                      // io.
  WebKitFrame,                            // io. -> WebKitScriptWorld
  WebKitWebPage,                          // io. -> WebKitFrame, WebKitWebEditor, WebKitScriptWorld, WebKitWebFormManager, WebKitUserMessage
  WebKitEditingCommands,                  // io.
  WebKitWebProcessExtension,              // io. -> WebKitWebPage, WebKitUserMessage


  fp_glib2,
  fp_GTK4;

  // sudo apt install libwebkitgtk-6.0-dev
  // pkg-config --cflags --libs webkitgtk-6.0


  //  function webkit_web_view_new: PGtkWidget; cdecl; external libwebkit;
  //  procedure webkit_web_view_load_uri(web_view: Pointer; uri: Pgchar); cdecl; external libwebkit;


  procedure activate(app: PGtkApplication; user_data: Tgpointer);
  var
    window, webView, box: PGtkWidget;
  begin

    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Window');
    gtk_window_set_default_size(GTK_WINDOW(window), 640, 480);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 20);
    gtk_widget_set_halign(box, GTK_ALIGN_CENTER);
    gtk_widget_set_valign(box, GTK_ALIGN_CENTER);

    gtk_window_set_child(GTK_WINDOW(window), box);

    webView := webkit_web_view_new;
    webkit_web_view_load_uri(WEBKIT_WEB_VIEW(webView), 'http://www.google.ch');

    gtk_widget_set_size_request(GTK_WIDGET(webView), 640, 480);

    gtk_box_append(GTK_BOX(box), webView);

    gtk_window_present(GTK_WINDOW(window));
  end;


  function main(argc: cint; argv: PPChar): cint;
  var
    app: PGtkApplication;
    status: longint;
  begin
    app := gtk_application_new('org.gtk.example', G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, 'activate', G_CALLBACK(@activate), nil);
    status := g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);

    Exit(status);
  end;

begin
  main(argc, argv);
end.
