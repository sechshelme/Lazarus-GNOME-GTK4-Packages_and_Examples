program project1;

uses
  fp_glib2,
  fp_rist;

  procedure main;
  var
    socket: PGSocket;
    err: PGError = nil;
    target_addr: PGSocketAddress;
    counter: integer = 0;
    payload_buffer: Pgchar;
    sent_bytes: Tgssize;
  begin
    socket := g_socket_new(G_SOCKET_FAMILY_IPV4, G_SOCKET_TYPE_DATAGRAM, G_SOCKET_PROTOCOL_UDP, @err);
    if socket = nil then begin
      g_printerr('Fehler beim Socket-Erstellen: %s'#10, err^.message);
      g_clear_error(@err);
      Exit;;
    end;

    target_addr := g_inet_socket_address_new_from_string('127.0.0.1', 1234);

    g_printf('GLib-UDP-Sender gestartet... (STRG+C zum Beenden)'#10);

    while True do begin
      payload_buffer := g_strdup_printf('Hallo GLib-Welt! Zähler: %d', counter);

      sent_bytes := g_socket_send_to(socket, target_addr, payload_buffer, strlen(payload_buffer), nil, @err);

      if sent_bytes < 0 then begin
        g_printerr('Sende-Fehler: %s'#10, @err^.message);
        g_clear_error(@err);
      end else begin
        g_printf('Gesendet: %s'#10, payload_buffer);
      end;

      Inc(counter);
      g_usleep(G_USEC_PER_SEC);
      g_free(payload_buffer);
    end;

    g_object_unref(target_addr);
    g_object_unref(socket);
  end;

begin
  main;;
end.
