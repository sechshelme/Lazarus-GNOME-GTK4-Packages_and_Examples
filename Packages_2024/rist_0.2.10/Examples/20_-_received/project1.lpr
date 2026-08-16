program project1;

uses
  fp_glib2,
  fp_rist;

  procedure main;
  var
    socket: PGSocket;
    err: PGError = nil;
    any_addr, sender_ip: PGInetAddress;
    bind_addr: PGSocketAddress;
    sender_addr: PGSocketAddress = nil;
    received_bytes: Tgssize;
    ip_str: Pgchar;
    buffer: array[0..1023] of char;
  begin
    socket := g_socket_new(G_SOCKET_FAMILY_IPV4, G_SOCKET_TYPE_DATAGRAM, G_SOCKET_PROTOCOL_UDP, @err);
    if socket = nil then begin
      g_printerr('Fehler beim Socket-Erstellen: %s'#10, err^.message);
      g_clear_error(@err);
      Exit;;
    end;

    any_addr := g_inet_address_new_any(G_SOCKET_FAMILY_IPV4);
    bind_addr := g_inet_socket_address_new(any_addr, 1234);
    g_object_unref(any_addr);

    if not g_socket_bind(socket, bind_addr, True, @err) then begin
      g_printerr('Fehler beim Binden: %s'#10, err^.message);
      g_clear_error(@err);
      g_object_unref(bind_addr);
      g_object_unref(socket);
      Exit;;
    end;

    g_printf('GLib-UDP-Empfänger lauscht auf Port 1234...'#10);

    while True do begin
      received_bytes := g_socket_receive_from(socket, @sender_addr, buffer, SizeOf(buffer) - 1, nil, @err);

      if received_bytes > 0 then begin
        buffer[received_bytes] := #0;

        sender_ip := g_inet_socket_address_get_address(G_INET_SOCKET_ADDRESS(sender_addr));
        ip_str := g_inet_address_to_string(sender_ip);

        g_printf('Empfangen von %s: %s'#10, ip_str, buffer);

        g_free(ip_str);
        g_object_unref(sender_addr);
        sender_addr := nil;
      end else if received_bytes < 0 then begin
        g_printerr('Empfangs-Fehler: %s'#10, err^.message);
        g_clear_error(@err);
        break;
      end;
    end;

    g_object_unref(bind_addr);
    g_object_unref(socket);
  end;

begin
  main;;
end.
