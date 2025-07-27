program project1;

uses
  ctypes,
  fp_glib2,
  fp_GLIBTools,
  fp_ibus,
  fp_GTK4;

const
  LabelText = 'Ich bin ein wirklich übergrosses endloses Label, das nicht hören will !';

  // === ibus

  procedure on_bus_connected(bus: PIBusBus; user_data: Tgpointer);
  begin
    g_print('IBus-Bus wurde verbunden.'#10);
  end;

  procedure on_bus_disconnected(bus: PIBusBus; user_data: Tgpointer);
  var
    loop: PGMainLoop absolute user_data;
  begin
    g_print('IBus-Bus wurde getrennt.'#10);
  end;

  procedure on_commit(contex: PIBusInputContext; text: pchar; user_data: Tgpointer);
  var
    loop: PGMainLoop absolute user_data;
  begin
    g_print('Committed text: %s'#10, text);
  end;

  // ========================

  function CreateEntryBox: PGtkWidget;
  var
    entry: PGtkWidget;
    buffer: PGtkEntryBuffer;
  begin
    Result := gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 0);

    buffer := gtk_entry_buffer_new(LabelText, -1);

    entry := gtk_entry_new;
    gtk_entry_set_buffer(GTK_ENTRY(entry), buffer);
    gtk_widget_set_hexpand(entry, True);

    gtk_box_append(GTK_BOX(Result), entry);
  end;

  procedure activate(app: PGtkApplication; {%H-}user_data: Tgpointer); cdecl;
  var
    window, box: PGtkWidget;
    bus: PIBusBus;
    context: PIBusInputContext;
  begin
    ibus_init;
    bus := ibus_bus_new;

    if not ibus_bus_is_connected(bus) then begin
      g_printerr('IBus Daemon läuft nicht oder ist nicht erreichbar.'#10);
      g_printerr('Stelle sicher, dass du das Programm in einer grafischen Session startest und IBus läuft.'#10);
      g_printerr('Starte ggf. ''ibus-daemon -drx'' in einem Terminal.'#10);
      g_object_unref(bus);
      //      Exit(1);
    end else begin
      g_print('IBus Daemon ist verbunden.'#10);
    end;

    context := ibus_bus_create_input_context(bus, 'example');
    g_signal_connect(context, 'commit-text', G_CALLBACK(@on_commit), nil);
    ibus_input_context_focus_in(context);


    g_signal_connect(bus, 'connected', G_CALLBACK(@on_bus_connected), nil);
    g_signal_connect(bus, 'disconnected', G_CALLBACK(@on_bus_disconnected), nil);

    // --------------

    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'GTK4 Label');
    gtk_window_set_default_size(GTK_WINDOW(window), 320, 200);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 0);
    gtk_window_set_child(GTK_WINDOW(window), box);

    gtk_box_append(GTK_BOX(box), CreateEntryBox);

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
