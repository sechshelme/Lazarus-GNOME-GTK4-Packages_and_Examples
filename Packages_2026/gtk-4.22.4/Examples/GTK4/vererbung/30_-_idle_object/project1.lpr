program project1;

uses
  fp_glib2,
  fp_GTK4,
  IdleObject;

  procedure quit_cp(widget: PGtkWidget; user_data: Tgpointer); cdecl;
  var
    window: PGtkWindow absolute user_data;
  begin
    gtk_window_destroy(window);
  end;

  procedure add_cp(widget: PGtkWidget; user_data: Tgpointer); cdecl;
  var
    idle_object: PIdleObject absolute user_data;
  begin
    idle_object_add(idle_object, 1000000);
  end;

  procedure triggered_cp(idle: PIdleObject; s: Pgchar; user_data: Tgpointer); cdecl;
  var
    lab: PGtkWidget absolute user_data;
  begin
    gtk_label_set_text(GTK_LABEL(lab), s);
  end;

  procedure activate(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    window, box, button, lab: PGtkWidget;
    idle: PIdleObject;
  begin
    g_object_set(gtk_settings_get_default, 'gtk-application-prefer-dark-theme', gTrue, nil);

    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Belt Drive');
    gtk_window_set_default_size(GTK_WINDOW(window), 640, 400);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);

    lab := gtk_label_new('0');
    gtk_box_append(GTK_BOX(box), lab);

    idle := idle_object_new;
    g_object_set_data_full(G_OBJECT(window), 'idle-logic', idle, @g_object_unref);
    g_signal_connect(idle, 'triggered', G_CALLBACK(@triggered_cp), lab);

    button := gtk_button_new_with_label('Add');
    g_signal_connect(button, 'clicked', G_CALLBACK(@add_cp), idle);
    gtk_box_append(GTK_BOX(box), button);

    button := gtk_button_new_with_label('Quit');
    g_signal_connect(button, 'clicked', G_CALLBACK(@quit_cp), window);
    gtk_box_append(GTK_BOX(box), button);

    gtk_window_set_child(GTK_WINDOW(window), box);
    gtk_window_present(GTK_WINDOW(window));
  end;

  procedure main;
  var
    app: PGtkApplication;
  begin
    app := gtk_application_new('org.gtk.example', G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, 'activate', G_CALLBACK(@activate), nil);
    g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);
  end;

begin
  main;
end.
