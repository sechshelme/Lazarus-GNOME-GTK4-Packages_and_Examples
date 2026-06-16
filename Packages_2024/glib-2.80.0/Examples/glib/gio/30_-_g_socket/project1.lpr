program project1;

uses
  fp_glib2;

  procedure main;
  const
    host = 'example.com';
    req: pchar = 'GET / HTTP/1.0'#13#10'Host: example.com'#13#10#13#10;
    port = 443;
    BUF_SIZE = 64;
  var
    client: PGSocketClient;
    connection: PGSocketConnection;
    err: PGError = nil;
    ostream: PGOutputStream;
    istream: PGInputStream;
    n: Tgssize;
    buf: array[0..BUF_SIZE - 1] of char;
  begin
    client := g_socket_client_new;
    g_socket_client_set_tls(client, gTrue);

    connection := g_socket_client_connect_to_host(client, host, port, nil, @err);
    if connection = nil then begin
      g_printerr('Verbindung fehlgeschlagen: %s'#10, err^.message);
      g_error_free(err);
      g_object_unref(client);
      Exit;
    end;

    ostream := g_io_stream_get_output_stream(G_IO_STREAM(connection));
    g_output_stream_write(ostream, req, strlen(req), nil, @err);

    istream := g_io_stream_get_input_stream(G_IO_STREAM(connection));
    repeat
      n := g_input_stream_read(istream, @buf, BUF_SIZE - 1, nil, @err);
      if n > 0 then begin
        buf[n] := #0;
        g_print('%s', @buf[0]);
      end else if err <> nil then begin
        g_printerr('Fehler beim Lesen: %s', err^.message);
        g_error_free(err);
        err := nil;
      end;
    until n <= 0;
    g_object_unref(connection);
    g_object_unref(client);
  end;


begin
  main;
end.
