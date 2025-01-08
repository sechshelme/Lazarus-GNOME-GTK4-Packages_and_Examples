program project1;

uses
  fp_glib2,
  fp_GTK4,

  adw_length_unit,                // io.
  adw_breakpoint,                 // io. -> adw_length_unit
  adw_dialog,                     // io. -> adw_breakpoint
  adw_application_window,         // io. -> adw_breakpoint, adw_dialog
  adw_toolbar_view,               // io.
  adw_header_bar,                 // io.
  adw_style_manager,              // io.
  adw_application,                // io.  > adw_style_manager

  ctypes;

procedure quit_clicked_cp(widget: PGtkWidget; Data: Tgpointer); cdecl;
var
  app: PGtkApplication absolute Data;
begin
  g_application_quit(G_APPLICATION(app));
end;

  procedure activate(app: PGtkApplication; user_data: Tgpointer);
  var
    window, toolbar_view, header_bar, label_, box, button: PGtkWidget;
  begin
    //    window := gtk_application_window_new(app);
    window := adw_application_window_new(app);
    toolbar_view := adw_toolbar_view_new;
    header_bar := adw_header_bar_new;

    box:=gtk_box_new(GTK_ORIENTATION_VERTICAL, 0);

    label_ := gtk_label_new ('Hello World');
    gtk_box_append(GTK_BOX(box), label_);

    button := gtk_button_new_with_label('Quit');
    gtk_box_append(GTK_BOX(box), button);
    g_signal_connect(button, 'clicked', G_CALLBACK(@quit_clicked_cp), app);

    adw_toolbar_view_add_top_bar (ADW_TOOLBAR_VIEW.ADW_TOOLBAR_VIEW (toolbar_view), header_bar);
    adw_toolbar_view_set_content (ADW_TOOLBAR_VIEW.ADW_TOOLBAR_VIEW (toolbar_view), box);

    gtk_window_set_title(GTK_WINDOW(window), 'Window');
    gtk_window_set_default_size(GTK_WINDOW(window), 200, 200);

    adw_application_window_set_content(adw_application_window.ADW_APPLICATION_WINDOW(window), toolbar_view);
    gtk_window_present(GTK_WINDOW(window));
  end;


  function main(argc: cint; argv: PPChar): cint;
  var
    status: longint;
    app: PAdwApplication;
  begin
//    app := gtk_application_new('org.gtk.example', G_APPLICATION_DEFAULT_FLAGS);
    app := adw_application_new ('org.example.Hello', 0);

    g_signal_connect(app, 'activate', G_CALLBACK(@activate), nil);
    status := g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);

    Exit(status);
  end;

begin
  main(argc, argv);
end.
