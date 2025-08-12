program project1;

uses
  fp_signal,
  fp_time,
  clib,
  fp_unistd,
  fp_stdlib,
  fp_stdio,
  fp_socket,
  fp_ioctl,
  fp_netinet,
  fp_systemd;

  // echo test | socat - UDP:127.0.0.1:7777
  // socat - UDP:127.0.0.1:7777 < main.c

  // echo "Test 1" | nc -u localhost 7777 -w0



  function timer_cp(s: Psd_event_source; usec: uint64; userdata: pointer): longint; cdecl;
  const
    font: array [0..3] of char = '\-/|';
    p: integer = 0;
  begin
    system.Write('  (', font[p mod 4], ')');
    Inc(p);
    system.Write(#27'[1G');
    sd_event_source_set_time_relative(s, 10000);
    sd_event_source_set_enabled(s, SD_EVENT_ON);
    Result := 0;
  end;

  function get_bytes_available(fd: longint): integer;
  var
    size: integer = 0;
  begin
    if ioctl(fd, FIONREAD, @size) < 0 then begin
      WriteLn('ioctl() error');
    end;
    Result := size;
  end;

  function io_cp(s: Psd_event_source; fd: longint; revents: uint32; userdata: pointer): longint; cdecl;
  const
    bufsize: integer = 0;
  var
    buffer: pchar;
    len: Tssize_t;
  begin
    ioctl(fd, FIONREAD, @bufsize);
    buffer := malloc(bufsize + 1);

    len := read(fd, buffer, bufsize);
    if len > 0 then begin
      buffer[len] := #0;
      printf('Buffer: %s'#10, buffer);
    end;
    Result := 0;
    WriteLn(bufsize, ' Bytes gelesen');

    free(buffer);
  end;

  function Create_Socket_fd: longint;
  var
    sa: Tsockaddr_in;
    fd: longint;
  begin
    fd := socket(AF_INET, SOCK_DGRAM or SOCK_CLOEXEC or SOCK_NONBLOCK, 0);
    if fd < 0 then begin
      WriteLn('socket() error');
    end;

    sa.sin_family := AF_INET;
    sa.sin_port := htons(7777);
    sa.sin_addr.s_addr := INADDR_ANY;

    if bind(fd, @sa, SizeOf(sa)) < 0 then begin
      WriteLn('bind()  error');
    end;
    Result := fd;
  end;


  procedure main;
  var
    event: Psd_event = nil;
    r, fd: longint;
  begin
    WriteLn('Daten an das Programm mit externne Terminal senden.');
    WriteLn('  echo "Hello World" | socat - UDP:127.0.0.1:7777');
    WriteLn('  socat - UDP:127.0.0.1:7777 < project1.pas');
    WriteLn();
    WriteLn('  echo "Hello World" | nc -u localhost 7777 -w0');
    WriteLn('  nc -u localhost 7777 -w0 < project1.pas');
    WriteLn();

    r := sd_event_new(@event);
    if r < 0 then begin
      WriteLn('sd_event_new()  fehler');
      Exit;
    end;

    fd := Create_Socket_fd;

    r := sd_event_add_io(event, nil, fd, EPOLLIN, @io_cp, nil);
    if r < 0 then begin
      WriteLn('sd_event_add_io()  fehler');
      Exit;
    end;

    r := sd_event_add_time_relative(event, nil, CLOCK_MONOTONIC, 10000, 0, @timer_cp, nil);
    if r < 0 then begin
      WriteLn('sd_event_add_time_relative()  fehler');
      Exit;
    end;

    r := sd_event_loop(event);
    if r < 0 then begin
      WriteLn('sd_event_loop()  fehler');
      Exit;
    end;

    sd_event_unref(event);
    close(fd);
  end;

begin
  main;
end.
