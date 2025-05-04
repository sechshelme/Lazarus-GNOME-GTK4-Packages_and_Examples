program project1;

uses
  ctypes,
  fp_glib2,
  fp_GTK4,

  vte,

  vteenums,
  vtepty,

  vteregex,

  vteterminal,


  math;

  procedure activate(app: PGtkApplication; user_data: Tgpointer);
  var
    window, main_box, sw: PGtkWidget;
  begin
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Window');
    gtk_window_set_default_size(GTK_WINDOW(window), 400, 400);

    main_box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);
    gtk_window_set_child(GTK_WINDOW(window), main_box);

    sw:=gtk_scrolled_window_new;
        gtk_box_append(GTK_BOX(main_box), sw);

        terminal := vte_terminal_new;
        gtk_scrolled_window_set_child(GTK_SCROLLED_WINDOW(scrolled_window), terminal);

    //    char *argv[] = { "/bin/bash", NULL };
        char *argv[] = { "/bin/fp", NULL };

        vte_terminal_spawn_async(
            VTE_TERMINAL(terminal),
            VTE_PTY_DEFAULT,
            NULL,           // Arbeitsverzeichnis (NULL = Standard)
            argv,           // Kommandozeilenargumente
            NULL,           // Umgebungsvariablen (NULL = erben)
            G_SPAWN_DEFAULT,
            NULL,           // child_setup callback
            NULL,           // child_setup_data
            NULL,           // child_setup_data_destroy
            -1,             // Timeout (Standard)
            NULL,           // cancellable
            NULL,           // callback
            NULL            // user_data
        );



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
