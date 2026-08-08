program project1;

uses
  fp_nm,
  fp_nma,
  fp_glib2,
  fp_GTK4;

  procedure print_hello(widget: PGtkWidget; Data: Tgpointer); cdecl;
  const
    counter: integer = 0;
  var
    s: Pgchar;
  begin
    Inc(counter);
    s := g_strdup_printf('Ich wurde %d gelickt', counter);
    gtk_button_set_label(GTK_BUTTON(widget), s);
    g_free(s);
  end;

  function CreateNMA: PGtkWidget;
  var
    connection: PNMConnection;
    s_con, s_wifi: PNMSetting;
    ssid: PGBytes;
  begin
    connection := NM_CONNECTION(nm_simple_connection_new);

    s_con := nm_setting_connection_new;
    g_object_set(s_con, NM_SETTING_CONNECTION_ID, 'Mein_Heim_WLAN', NM_SETTING_CONNECTION_TYPE, NM_SETTING_WIRELESS_SETTING_NAME, nil);
    nm_connection_add_setting(connection, NM_SETTING(s_con));

    s_wifi := nm_setting_wireless_new;
    ssid := g_bytes_new(pchar('Mein_Heim_WLAN'), 14);
    g_object_set(s_wifi, NM_SETTING_WIRELESS_SSID, ssid, nil);
    nm_connection_add_setting(connection, NM_SETTING(s_wifi));
    g_bytes_unref(ssid);

    Result := nma_bar_code_widget_new(connection);
    g_object_unref(connection);
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

    gtk_box_append(GTK_BOX(box), CreateNMA);

    button := gtk_button_new_with_label('Hello World');
    g_signal_connect(button, 'clicked', G_CALLBACK(@print_hello), nil);
    gtk_box_append(GTK_BOX(box), button);

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
