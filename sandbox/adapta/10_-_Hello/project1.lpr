program project1;

uses
  fp_glib2,
  fp_GTK4,
  fp_adapta;

  procedure print_hello(widget: PGtkWidget; Data: Tgpointer); cdecl;
  const
    counter: Integer = 0;
  var
    cs:String;
  begin
    Inc(counter);
    str(counter, cs);
    gtk_button_set_label(GTK_BUTTON(widget), pchar('Ich wurde ' + cs + ' geklickt'));
  end;


  procedure activate(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    window, box, button: PGtkWidget;
  begin
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Window');
    gtk_window_set_default_size(GTK_WINDOW(window), 200, 200);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 0);
    gtk_widget_set_halign(box, GTK_ALIGN_CENTER);
    gtk_widget_set_valign(box, GTK_ALIGN_CENTER);

    gtk_window_set_child(GTK_WINDOW(window), box);

    button := gtk_button_new_with_label('Hello World');

    g_signal_connect(button, 'clicked', G_CALLBACK(@print_hello), nil);

    gtk_box_append(GTK_BOX(box), button);
    gtk_window_present(GTK_WINDOW(window));
  end;


  procedure main;
  var
    app: PAdapApplication;
  begin
    app := adap_application_new('de.example.libadapta', G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, 'activate', G_CALLBACK(@activate), nil);
    g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);
  end;

begin
  main;
end.
