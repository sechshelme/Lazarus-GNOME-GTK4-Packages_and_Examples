program project1;

uses
  ctypes,
  fp_glib2,
  fp_pango,
  fp_GTK4,
  fp_JSC,
  fp_webkitgtk6;

const
  cmdKey = 'cmdKey';
  cmHome = 1000;
  cmForward = 1001;
  cmBack = 1002;

var
  URI_Label: PGtkWidget;

  procedure on_button_clicked(widget: PGtkWidget; user_data: Tgpointer); cdecl;
  var
    webView: PWebKitWebView absolute user_data;
  begin
    case GPOINTER_TO_INT(g_object_get_data(G_OBJECT(widget), cmdKey)) of
      cmHome: begin
        webkit_web_view_load_uri(webView, 'https://www.google.ch');
      end;
      cmForward: begin
        webkit_web_view_go_forward(webView);
      end;
      cmBack: begin
        webkit_web_view_go_back(webView);
      end;
      else begin
        WriteLn('unknow');
      end;
    end;
  end;

  procedure load_finished_cb(web_view: PWebKitWebView; web_frame: Pointer; {%H-}user_data: Tgpointer);
  var
    uri: Pgchar;
  begin
    uri := webkit_web_view_get_uri(web_View);
    if uri <> nil then begin
      gtk_label_set_label(GTK_LABEL(URI_Label), uri);
    end else begin
      WriteLn('nil');
    end;
  end;


  procedure activate(app: PGtkApplication; {%H-}user_data: Tgpointer); cdecl;
  var
    window, webView, box, toolbar_box, button: PGtkWidget;
  begin
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'GTK4 webkit Browser');
    gtk_window_set_default_size(GTK_WINDOW(window), 640, 480);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 0);
    gtk_window_set_child(GTK_WINDOW(window), box);

    toolbar_box := gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 0);
    gtk_box_append(GTK_BOX(box), toolbar_box);

    webView := webkit_web_view_new;
    gtk_widget_set_vexpand(webView, True);
    gtk_widget_set_hexpand(webView, True);
    webkit_web_view_load_uri(WEBKIT_WEB_VIEW(webView), 'https://www.lazarusforum.de');
    g_signal_connect(webView, 'load-changed', G_CALLBACK(@load_finished_cb), URI_Label);
    gtk_box_append(GTK_BOX(box), webView);

    button := gtk_button_new_from_icon_name('go-home');
    g_object_set_data(G_OBJECT(button), cmdKey, GINT_TO_POINTER(cmHome));
    gtk_box_append(GTK_BOX(toolbar_box), button);
    g_signal_connect(button, 'clicked', G_CALLBACK(@on_button_clicked), webView);

    button := gtk_button_new_from_icon_name('go-previous');
    g_object_set_data(G_OBJECT(button), cmdKey, GINT_TO_POINTER(cmBack));
    gtk_box_append(GTK_BOX(toolbar_box), button);
    g_signal_connect(button, 'clicked', G_CALLBACK(@on_button_clicked), webView);

    button := gtk_button_new_from_icon_name('go-next');
    g_object_set_data(G_OBJECT(button), cmdKey, GINT_TO_POINTER(cmForward));
    gtk_box_append(GTK_BOX(toolbar_box), button);
    g_signal_connect(button, 'clicked', G_CALLBACK(@on_button_clicked), webView);

    URI_Label := gtk_label_new('http');
    gtk_widget_set_hexpand(URI_Label, True);
    gtk_label_set_xalign(GTK_LABEL(URI_Label), 0.0);
    gtk_label_set_ellipsize(GTK_LABEL(URI_Label), PANGO_ELLIPSIZE_END);
    gtk_box_append(GTK_BOX(toolbar_box), URI_Label);

    gtk_window_present(GTK_WINDOW(window));
  end;


  function main(argc: cint; argv: PPChar): cint;
  var
    app: PGtkApplication;
    status: longint;
  begin
    g_printf(#10'Version: %d.%d.%d'#10#10, webkit_get_major_version,webkit_get_minor_version, webkit_get_micro_version);


    app := gtk_application_new('org.webkitgtk.example', G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, 'activate', G_CALLBACK(@activate), nil);
    status := g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);

    Exit(status);
  end;

begin
  main(argc, argv);
end.
