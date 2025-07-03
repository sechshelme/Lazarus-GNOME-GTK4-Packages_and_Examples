program project1;

uses
  fp_stdio,
  fp_libssh;

  procedure main;
  var
    buffer: array[0..256 - 1] of char;
    session: Tssh_session;
    rc, nbytes: longint;
    channel: Tssh_channel;
    i: integer;
  begin
    session := ssh_new;
    if session = nil then begin
      Exit;
    end;
    ssh_options_set(session, SSH_OPTIONS_HOST, pchar('localhost'));
    ssh_options_set(session, SSH_OPTIONS_USER, pchar('test'));
    ssh_options_set(session, SSH_OPTIONS_PORT_STR, pchar('22'));

    rc := ssh_connect(session);
    if rc <> SSH_OK then begin
      fprintf(stderr, 'Fehler beim Verbinden: %s'#10, ssh_get_error(session));
      ssh_free(session);
      Exit;
    end;

    rc := ssh_userauth_password(session, nil, 'xxxxxx');
    if rc <> SSH_AUTH_SUCCESS then begin
      fprintf(stderr, 'Authentifizierung fehlgeschlagen: %s'#10, ssh_get_error(session));
      ssh_disconnect(session);
      ssh_free(session);
      Exit;
    end;

    channel := ssh_channel_new(session);
    if channel = nil then begin
      Exit;
    end;
    rc := ssh_channel_open_session(channel);
    if rc <> SSH_OK then begin
      Exit;
    end;
    rc := ssh_channel_request_exec(channel, 'ls /');
    if rc <> SSH_OK then begin
      Exit;
    end;

    repeat
      nbytes := ssh_channel_read(channel, @buffer, sizeof(buffer), 0);
      //      fwrite(@buffer, 1, nbytes, stdout);
      for i := 0 to nbytes - 1 do begin
        Write(buffer[i]);
      end;
    until nbytes <= 0;

    ssh_channel_send_eof(channel);
    ssh_channel_close(channel);
    ssh_channel_free(channel);
    ssh_disconnect(session);
    ssh_free(session);
  end;

begin
  main;
end.
