program project1;

uses
  ctypes,
  fp_glib2,
  fp_GTK4,
  fp_vte_2_91;

  procedure activate(app: PGtkApplication; user_data: Tgpointer);
  var
    window, main_box, sw, terminal: PGtkWidget;
  const
    argv: array of pchar = ('/bin/bash', nil);
  begin
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Window');
    gtk_window_set_default_size(GTK_WINDOW(window), 800, 600);

    main_box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);
    gtk_window_set_child(GTK_WINDOW(window), main_box);

    sw := gtk_scrolled_window_new;
    gtk_widget_set_vexpand(sw, True);

    gtk_box_append(GTK_BOX(main_box), sw);

    terminal := vte_terminal_new;
    gtk_scrolled_window_set_child(GTK_SCROLLED_WINDOW(sw), terminal);

    gtk_box_append(GTK_BOX(main_box), terminal);

    vte_terminal_spawn_async(VTE_TERMINAL(terminal), VTE_PTY_DEFAULT, nil, PPChar(argv), nil,
      G_SPAWN_DEFAULT, nil, nil, nil, -1, nil, nil, nil);

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
