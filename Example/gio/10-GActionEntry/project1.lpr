program project1;

uses
  ctypes,
  SysUtils,
  fp_glib2,
  fp_GTK4;

  // https://www.perplexity.ai/search/gib-mir-ein-c-beispiel-mit-gac-u2Jm.NlQRfypk7YHPa0TxA

  procedure quit_activated(action: PGSimpleAction; parameter: PGVariant; user_data: Tgpointer); cdecl;
  begin
    WriteLn('quit_activated');
    //    g_application_quit(G_APPLICATION(user_data));
  end;


  procedure print_activated(action: PGSimpleAction; parameter: PGVariant; user_data: Tgpointer); cdecl;
  var
    name: Pgchar;
  begin
//    WriteLn('hello_activated');
    name:=g_action_get_name(G_ACTION( action));
    g_printf('Hello World ! %s'#10,name);
  end;



  procedure btn_click(widget: PGtkWidget; Data: Tgpointer);
  const
    counter: cint = 0;
  var
    app: PGtkApplication absolute Data;
    action: PGAction;
  begin
    Inc(counter);
    gtk_button_set_label(GTK_BUTTON(widget), PChar('Ich wurde ' + IntToStr(counter) + ' gelickt'));

    action := g_action_map_lookup_action(G_ACTION_MAP(app), 'print');
    g_action_activate(action, nil);
  end;


  procedure activate(app: PGtkApplication; user_data: Tgpointer);
  var
    window, box, button: PGtkWidget;

    app_actions: array of TGActionEntry = (
      (Name: 'quit'; activate: @print_activated; parameter_type: nil; state: nil; change_state: nil; padding: (0, 0, 0)),
      (Name: 'print'; activate: @print_activated; parameter_type: nil; state: nil; change_state: nil; padding: (0, 0, 0))
      );
    quit_accels: array of pchar = ('<Ctrl>p', nil);


  begin
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Window');
    gtk_window_set_default_size(GTK_WINDOW(window), 200, 200);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 0);
    gtk_widget_set_halign(box, GTK_ALIGN_CENTER);
    gtk_widget_set_valign(box, GTK_ALIGN_CENTER);

    gtk_window_set_child(GTK_WINDOW(window), box);

    button := gtk_button_new_with_label('Hello World');

    g_signal_connect(button, 'clicked', G_CALLBACK(@btn_click), app);
    //    g_signal_connect_swapped(button, 'clicked', G_CALLBACK(@gtk_window_destroy), window);

    gtk_box_append(GTK_BOX(box), button);

    g_action_map_add_action_entries(G_ACTION_MAP(app), PGActionEntry(app_actions), Length(app_actions), app);

    gtk_application_set_accels_for_action(app, 'app.quit', g_strsplit('<Ctrl>o,<Ctrl>w', ',',-1));
    gtk_application_set_accels_for_action(app, 'app.print', g_strsplit('<control>p', ',',-1));

//    gtk_application_set_accels_for_action(GTK_APPLICATION(app),
//      'app.print',
//      PPChar(quit_accels));


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
