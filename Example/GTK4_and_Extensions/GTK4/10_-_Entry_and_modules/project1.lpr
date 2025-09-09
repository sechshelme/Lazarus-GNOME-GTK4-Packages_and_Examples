program project1;

uses
  ctypes,
  fp_glib2,
  fp_gmodule,
  fp_GLIBTools,
  fp_pango,
  fp_GTK4;

type
  TMyWidgets = record
    toolbar,
    text_view: PGtkWidget;
  end;
  PMyWidgets = ^TMyWidgets;

var
  MyWidgets: TMyWidgets;

var
  module_C: PGModule = nil;
  module_PAS: PGModule = nil;

  procedure on_close_clicked(widget: PGtkWidget; Data: Tgpointer); cdecl;
  var
    window: PGtkWindow;
  begin
    window := GTK_WINDOW(Data);
    gtk_window_destroy(window);
  end;

  procedure on_add_C_plugin_clicked(widget: PGtkWidget; Data: Tgpointer); cdecl;
  var
    Plugin_init: procedure(w: PMyWidgets); cdecl;
  begin
    if module_C <> nil then begin
      Exit;
    end;

    if not g_module_supported then begin
      g_printf('Dynamic modules are not supported on this platform'#10);
      Exit;
    end;
    module_C := g_module_open('plugin_c/libplugin_c', G_MODULE_BIND_LAZY);
    if module_C = nil then begin
      g_printf('Error loading library: %s'#10, g_module_error);
      Exit;
    end;

    if not g_module_symbol(module_C, 'Plugin_init_C', @Plugin_init) then begin
      g_printf('Error loading symbol "Plugin_init_c": %s'#10, g_module_error);
      g_module_close(module_C);
      Exit;
    end;

    g_printf('Module; %s geladen'#10, g_module_name(module_C));
    Plugin_init(@MyWidgets);
  end;


  procedure on_add_PAS_plugin_clicked(widget: PGtkWidget; Data: Tgpointer); cdecl;
  var
    Plugin_init: procedure(w: PMyWidgets); cdecl;
  begin
    if module_PAS <> nil then begin
      Exit;
    end;

    if not g_module_supported then begin
      g_printf('Dynamic modules are not supported on this platform'#10);
      Exit;
    end;
    module_PAS := g_module_open('plugin_pas/libplugin_pas', G_MODULE_BIND_LAZY);
    if module_PAS = nil then begin
      g_printf('Error loading library: %s'#10, g_module_error);
      Exit;
    end;

    if not g_module_symbol(module_PAS, 'Plugin_init_PAS', @Plugin_init) then begin
      g_printf('Error loading symbol "Plugin_init_pas": %s'#10, g_module_error);
      g_module_close(module_PAS);
      Exit;
    end;

    g_printf('Module; %s geladen'#10, g_module_name(module_PAS));
    Plugin_init(@MyWidgets);
  end;


  procedure activate(app: PGtkApplication; {%H-}user_data: Tgpointer); cdecl;
  var
    window, vbox, btn_add_c, btn_close, scrolled_window,
    btn_add_pas: PGtkWidget;
  begin
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'GTK4 Entry with Modules');
    gtk_window_set_default_size(GTK_WINDOW(window), 640, 480);

    vbox := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);
    gtk_window_set_child(GTK_WINDOW(window), vbox);

    MyWidgets.toolbar := gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 2);
    gtk_box_append(GTK_BOX(vbox), MyWidgets.toolbar);

    btn_add_c := gtk_button_new_with_label('Add C');
    gtk_box_append(GTK_BOX(MyWidgets.toolbar), btn_add_c);
    g_signal_connect(btn_add_c, 'clicked', G_CALLBACK(@on_add_C_plugin_clicked), MyWidgets.text_view);

    btn_add_pas := gtk_button_new_with_label('Add PAS');
    gtk_box_append(GTK_BOX(MyWidgets.toolbar), btn_add_pas);
    g_signal_connect(btn_add_pas, 'clicked', G_CALLBACK(@on_add_PAS_plugin_clicked), MyWidgets.text_view);

    btn_close := gtk_button_new_with_label('Close');
    gtk_box_append(GTK_BOX(MyWidgets.toolbar), btn_close);
    g_signal_connect(btn_close, 'clicked', G_CALLBACK(@on_close_clicked), window);

    scrolled_window := gtk_scrolled_window_new();
    gtk_widget_set_hexpand(scrolled_window, True);
    gtk_widget_set_vexpand(scrolled_window, True);
    gtk_box_append(GTK_BOX(vbox), scrolled_window);

    MyWidgets.text_view := gtk_text_view_new();
    gtk_text_view_set_wrap_mode(GTK_TEXT_VIEW(MyWidgets.text_view), GTK_WRAP_WORD_CHAR);
    gtk_scrolled_window_set_child(GTK_SCROLLED_WINDOW(scrolled_window), MyWidgets.text_view);

    gtk_window_present(GTK_WINDOW(window));
  end;

  procedure shutdown(app: PGtkApplication; {%H-}user_data: Tgpointer); cdecl;
  begin
    if module_C <> nil then  begin
      g_module_close(module_C);
      module_C := nil;
    end;
    if module_PAS <> nil then  begin
      g_module_close(module_PAS);
      module_PAS := nil;
    end;
    g_printf('Alles frei gegeben'#10);
  end;

  function main(argc: cint; argv: PPChar): cint;
  var
    app: PGtkApplication;
    status: longint;
  begin
    app := gtk_application_new('org.webkitgtk.example', G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, 'activate', G_CALLBACK(@activate), nil);
    g_signal_connect(app, 'shutdown', G_CALLBACK(@shutdown), nil);
    status := g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);

    Exit(status);
  end;

begin
  main(argc, argv);
end.
