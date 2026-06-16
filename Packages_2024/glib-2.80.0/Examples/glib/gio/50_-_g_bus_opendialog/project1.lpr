program project1;

uses
  fp_glib2;

type
  TPortalData = record
    loop: PGMainLoop;
    response: integer;
    selected_path: pchar;
  end;
  PPortalData = ^TPortalData;


  procedure on_portal_response(connection: PGDBusConnection; sender_name, object_path, interface_name, signal_name: Pgchar; parameters: PGVariant; user_data: Tgpointer); cdecl;
  var
    data: PPortalData absolute user_data;
    results, uris_var: PGVariant;
    response_code: Tguint32;
    iter: PGVariantIter;
    uri: Pgchar;
  begin
    g_variant_get(parameters, '(u@a{sv})', @response_code, @results);

    if response_code = 0 then begin
      uris_var := g_variant_lookup_value(results, 'uris', G_VARIANT_TYPE('as'));
      if uris_var <> nil then begin
        g_variant_get(uris_var, 'as', @iter);
        if g_variant_iter_next(iter, '&s', @uri) then begin
          data^.selected_path := g_strdup(uri);
        end;
        g_variant_iter_free(iter);
        g_variant_unref(uris_var);
      end;
    end;

    data^.response := response_code;
    g_variant_unref(results);
    g_main_loop_quit(data^.loop);
  end;

  procedure main;
  var
    data: TPortalData;
    conn: PGDBusConnection;
    err: PGError = nil;
    subscription_id: Tguint;
    opt_builder: TGVariantBuilder;
    params: PGVariant;
  begin
    data.loop := g_main_loop_new(nil, False);
    data.response := -1;
    data.selected_path := nil;

    conn := g_bus_get_sync(G_BUS_TYPE_SESSION, nil, @err);
    if conn = nil then begin
      g_printf('Fehler beim D-Bus-Connect: %s'#10, err^.message);
      Exit;
    end;

    subscription_id := g_dbus_connection_signal_subscribe(
      conn, 'org.freedesktop.portal.Desktop', 'org.freedesktop.portal.Request', 'Response',
      nil, nil, G_DBUS_SIGNAL_FLAGS_NONE, @on_portal_response, @data, nil);

    g_variant_builder_init(@opt_builder, G_VARIANT_TYPE('a{sv}'));
    g_variant_builder_add(@opt_builder, '{sv}', 'handle_token', g_variant_new_string('mein_eindeutiger_token'));

    params := g_variant_new('(ss@a{sv})', '', 'Echter Portal-Dialog', g_variant_builder_end(@opt_builder));

    g_dbus_connection_call_sync(conn,
      'org.freedesktop.portal.Desktop',
      '/org/freedesktop/portal/desktop',
      'org.freedesktop.portal.FileChooser',
      'OpenFile',
      params, nil, G_DBUS_CALL_FLAGS_NONE, -1, nil, @err);

    if err <> nil then begin
      g_printf('Fehler beim Aufruf: %s'#10, err^.message);
      Exit;
    end;

    g_printf('Warte auf Benutzereingabe...'#10);

    //    g_main_loop_run(data.loop);
    repeat
      g_main_context_iteration(nil, False);
      g_print('.');
      g_usleep(50000);
    until data.response <> -1;
    WriteLn('Abgeschlossen');

    if (data.response = 0) and (data.selected_path <> nil) then begin
      g_printf('Ausgewählte Datei (URI): %s'#10, data.selected_path);
    end else begin
      g_printf('Abgebrochen oder Fehler.');
    end;

    g_dbus_connection_signal_unsubscribe(conn, subscription_id);
    g_free(data.selected_path);
    g_object_unref(conn);
    g_main_loop_unref(data.loop);
  end;


begin
  main;
end.
