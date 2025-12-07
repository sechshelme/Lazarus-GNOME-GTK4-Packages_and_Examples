program project1;

uses
  fp_socket,
  fp_unistd,
  fp_stdio,
  fp_netdb,
  fp_gnutls;

  procedure my_log_func(level: longint; msg: pchar); cdecl;
  begin
    fprintf(stderr, 'GnuTLS[%d]: %s', level, msg);
  end;

  procedure main;
  const
    host: pchar = 'www.example.com';
    port: pchar = '443';

    req: pchar =
      'GET / HTTP/1.1'#10 +
      'Host: www.example.com'#10 +
      'User-Agent: Mozilla/5.0'#10 +
      'Connection: close'#10 +
      #10;

  var
    hints: Taddrinfo;
    res: Paddrinfo;
    sock, ret: longint;
    xcred: Tgnutls_certificate_credentials_t;
    session: Tgnutls_session_t;
    sent, n: Tssize_t;
    got_data: integer;
    buf: array [0..4096 - 1] of char;

    procedure cleanup;
    begin
      gnutls_bye(session, GNUTLS_SHUT_RDWR);
      gnutls_deinit(session);
      gnutls_certificate_free_credentials(xcred);
      gnutls_global_deinit();
      close(sock);
      freeaddrinfo(res);
    end;

  begin
    hints := Default(Taddrinfo);

    gnutls_global_set_log_level(9);
    gnutls_global_set_log_function(@my_log_func);

    hints.ai_family := AF_UNSPEC;
    hints.ai_socktype := SOCK_STREAM;
    if getaddrinfo(host, port, @hints, @res) <> 0 then begin
      perror('getaddrinfo');
      Exit;
    end;

    sock := fp_socket.socket(res^.ai_family, res^.ai_socktype, res^.ai_protocol);
    if sock < 0 then begin
      perror('socket');
      freeaddrinfo(res);
      Exit;
    end;

    if connect(sock, res^.ai_addr, res^.ai_addrlen) <> 0 then begin
      perror('connect');
      close(sock);
      freeaddrinfo(res);
      Exit;
    end;

    gnutls_global_init();
    gnutls_certificate_allocate_credentials(@xcred);
    gnutls_init(@session, GNUTLS_CLIENT);
    gnutls_server_name_set(session, GNUTLS_NAME_DNS, host, strlen(host));
    gnutls_set_default_priority(session);
    gnutls_credentials_set(session, GNUTLS_CRD_CERTIFICATE, xcred);
    gnutls_transport_set_int(session, sock);

    ret := gnutls_handshake(session);
    if ret < 0 then begin
      fprintf(stderr, 'Handshake failed: %s'#10, gnutls_strerror(ret));
      cleanup;
      Exit;
    end else begin
      printf('Handshake erfolgreich!'#10);
    end;

    sent := gnutls_record_send(session, req, strlen(req));
    if sent < 0 then begin
      fprintf(stderr, 'Send failed: %s'#10, gnutls_strerror(sent));
      cleanup;
      Exit;
    end else begin
      printf('Request gesendet (%zd Bytes)'#10, sent);
    end;

    got_data := 0;
    while True do begin
      n := gnutls_record_recv(session, @buf, sizeof(buf) - 1);
      if n > 0 then begin
        buf[n] := #0;
        printf('%s', buf);
        got_data := 1;
      end else if n = 0 then begin
        fprintf(stderr, #10'Verbindung wurde vom Server geschlossen (EOF).'#10);
        break;
      end else if (n = GNUTLS_E_AGAIN) or (n = GNUTLS_E_INTERRUPTED) then begin
        usleep(10000);
        continue;
      end else begin
        fprintf(stderr, #10'Fehler beim Empfangen: %s'#10, gnutls_strerror(n));
        break;
      end;
    end;
    if got_data = 0 then begin
      fprintf(stderr, 'Keine Daten vom Server erhalten.'#10);
    end;

    cleanup;
    Exit;
  end;


begin
  main;
end.
