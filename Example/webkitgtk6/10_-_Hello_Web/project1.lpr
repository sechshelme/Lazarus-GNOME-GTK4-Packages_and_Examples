program project1;

uses
  ctypes,
  fp_glib2,
  fp_GTK4,
  fp_webkitgtk6;

const
  cmdKey = 'cmdKey';
  cmForward = 1000;
  cmBack = 1001;

var
  URI_Label: PGtkWidget;


  procedure on_button_clicked(widget: PGtkWidget; user_data: Tgpointer); cdecl;
  var
    webView: PWebKitWebView absolute user_data;
    uri: Pgchar;
  begin
    case GPOINTER_TO_INT(g_object_get_data(G_OBJECT(widget), cmdKey)) of
      cmForward: begin
        WriteLn('forward');
        webkit_web_view_go_forward(webView);
      end;
      cmBack: begin
        WriteLn('back');
        webkit_web_view_go_back(webView);
      end;
      else begin
        WriteLn('unknow');
      end;
    end;
    uri := webkit_web_view_get_uri(webView);
    if uri <> nil then begin
      gtk_label_set_label(GTK_LABEL(URI_Label), uri);
    end else begin
      WriteLn('nil');
    end;
  end;

procedure load_finished_cb(web_view:PWebKitWebView;web_frame:Pointer; {%H-}user_data: Tgpointer);
  begin
    WriteLn('loadf');

  end;


  procedure activate(app: PGtkApplication; {%H-}user_data: Tgpointer); cdecl;
  var
    window, webView, box, toolbar_box, buttonBack, buttonForward: PGtkWidget;
  begin
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'GTK4 webkit Browser');
    gtk_window_set_default_size(GTK_WINDOW(window), 640, 480);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 0);
    gtk_window_set_child(GTK_WINDOW(window), box);

    toolbar_box := gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 0);
    gtk_box_append(GTK_BOX(box), toolbar_box);

    // https://stackoverflow.com/questions/36073941/webkitgtk-signal-to-detect-redirect-event-to-a-url-that-is-invalid
    URI_Label := gtk_label_new('http');

    webView := webkit_web_view_new;
    gtk_widget_set_vexpand(webView, True);
    gtk_widget_set_hexpand(webView, True);
    webkit_web_view_load_uri(WEBKIT_WEB_VIEW(webView), 'https://www.lazarusforum.de');
    g_signal_connect(webView, 'load-changed', G_CALLBACK(@load_finished_cb), URI_Label);
    gtk_box_append(GTK_BOX(box), webView);

    buttonBack := gtk_button_new_from_icon_name('go-previous');
    g_object_set_data(G_OBJECT(buttonBack), cmdKey, GINT_TO_POINTER(cmBack));
    gtk_box_append(GTK_BOX(toolbar_box), buttonBack);
    g_signal_connect(buttonBack, 'clicked', G_CALLBACK(@on_button_clicked), webView);

    buttonForward := gtk_button_new_from_icon_name('go-next');
    g_object_set_data(G_OBJECT(buttonForward), cmdKey, GINT_TO_POINTER(cmForward));
    gtk_box_append(GTK_BOX(toolbar_box), buttonForward);
    g_signal_connect(buttonForward, 'clicked', G_CALLBACK(@on_button_clicked), webView);

    gtk_box_append(GTK_BOX(toolbar_box), URI_Label);


    gtk_window_present(GTK_WINDOW(window));
  end;


  function main(argc: cint; argv: PPChar): cint;
  var
    app: PGtkApplication;
    status: longint;
  begin
    app := gtk_application_new('org.webkitgtk.example', G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, 'activate', G_CALLBACK(@activate), nil);
    status := g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);

    Exit(status);
  end;

begin
  main(argc, argv);
end.
