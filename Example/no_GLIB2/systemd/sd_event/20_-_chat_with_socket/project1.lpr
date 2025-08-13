program project1;

uses
  fp_libc_tools,
  fp_signal,
  fp_time,
  clib,
  fp_unistd,
  fp_stdlib,
  fp_stdio,
  fp_socket,
  fp_string,
  fp_ioctl,
  fp_netinet,
  fp_termios,
  fp_systemd;

  // echo test | socat - UDP:127.0.0.1:7777
  // socat - UDP:127.0.0.1:7777 < main.c
  // echo "Test 1" | nc -u localhost 7777 -w0

(*
Variante 1: UDP verwenden
text
# Server:
nc -kul 7777
# Client:
echo test | socat - UDP:127.0.0.1:7777
socat - UDP:127.0.0.1:7777 < main.c

Variante 2: TCP verwenden
text
# Server:
nc -l 7777
# Client:
echo test | socat - TCP:127.0.0.1:7777
socat - TCP:127.0.0.1:7777 < main.c


Senden
echo "Test 1" | nc -u localhost 7777 -w0
echo test | socat - UDP:localhost:7777
*)

type
  TPortConfig = record
    ReadPort, WritePort: word;
    ip: pchar;
  end;

var
  PortConfig: TPortConfig;

  procedure PrintChat(s: pchar; col:Byte);
  Const
    Row=21;
  begin
    TextColor(col);
    printf(#27'[3;%dr', Row);
    printf(#27'[%d;1H', Row);
    printf(s);
    printf(#27'[r');
  end;

  function timer_cp(s: Psd_event_source; usec: uint64; userdata: pointer): longint; cdecl;
  const
    font: array [0..3] of char = '\-/|';
    p: integer = 0;
  begin
    GotoXY(1,1);
    printf(#27'[1G');
    printf('(%c)',font[p mod 4]);
    Inc(p);
    //    system.Write(#27'[1G');
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

  function io_socket_cp(s: Psd_event_source; fd: longint; revents: uint32; userdata: pointer): longint; cdecl;
  var
    bufsize: integer = 0;
    buffer: pchar;
    len: Tssize_t;
  begin
    ioctl(fd, FIONREAD, @bufsize);
    buffer := malloc(bufsize + 1);

    len := read(fd, buffer, bufsize);
    if len > 0 then begin
      buffer[len] := #0;
      PrintChat(buffer, 13);
    end;
    Result := 0;
    //    WriteLn(bufsize, ' Bytes gelesen');

    free(buffer);
  end;

  procedure SendBuffer(message: pchar);
  var
    sockfd: longint;
    sa: Tsockaddr_in;
  begin
    sockfd := socket(AF_INET, SOCK_DGRAM, 0);
    if sockfd < 0 then begin
      WriteLn('Socket-Erstellung fehlgeschlagen');
      Exit;
    end;

    // Serveradresse konfigurieren
    memset(@sa, 0, sizeof(sa));
    sa.sin_family := AF_INET;
    sa.sin_port := htons(PortConfig.WritePort);
    sa.sin_addr.s_addr := inet_addr(PortConfig.ip);

    if sendto(sockfd, message, strlen(message), 0, @sa, sizeof(sa)) < 0 then begin
      WriteLn('Senden fehlgeschlagen');
    end else begin
      //      WriteLn('Nachricht gesendet: ', message);
    end;

    close(sockfd);
  end;

  function io_keyboard_cp(s: Psd_event_source; fd: longint; revents: uint32; userdata: pointer): longint; cdecl;
  var
    bufsize: integer = 0;
    KeyBuffer: pchar;
    len: Tssize_t;
    s1: string;
    i: integer;
  const
    SendStr: string = '';
  begin
    ioctl(fd, FIONREAD, @bufsize);
    KeyBuffer := malloc(bufsize + 1);

    len := read(fd, KeyBuffer, bufsize);
    if len <= 0 then begin
      free(KeyBuffer);
      Exit(0);
    end;
    if len = 1 then begin
      case KeyBuffer[0] of
        #27: begin
          sd_event_exit(sd_event_source_get_event(s), 0);
        end;
        #32: begin
          //          SendBuffer('Hello World !'#10);
        end;
        #10: begin
          SendBuffer(pchar(SendStr));
          PrintChat(pchar(SendStr), 7);
          SendStr := '';
        end;
      end;
      SendStr := SendStr + KeyBuffer[0];
    end;
    GotoXY(1, 23);
    printf('Keys (%d) : ',bufsize);

    s1 := '';
    for i := 0 to bufsize - 1 do begin
      WriteStr(s1, s1, byte(KeyBuffer[i]), ' ');
    end;
    printf(PChar( s1));

    GotoXY(1, 24);
    printf('Send: %s',PChar( SendStr));
    fflush(stdout);


    free(KeyBuffer);
    Exit(0);
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
    sa.sin_port := htons(PortConfig.ReadPort);
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
    WriteLn('  nc -kul 7777');
    WriteLn('  nc -u localhost 7777 -w0 < project1.pas');

    ClrScr;

//    WriteLn('ParamCount: ', ParamCount);

    if ParamCount >= 1 then begin
      WriteLn('Alternativ');

//      PortConfig.ip := '127.0.0.1';
      PortConfig.ip := '192.168.0.185';
      PortConfig.ReadPort := 7777;
      PortConfig.WritePort := 7777;
    end else begin
//        PortConfig.ip := '127.0.0.1';
        PortConfig.ip := '192.168.0.88';
      PortConfig.ReadPort := 7777;
      PortConfig.WritePort := 7777;
    end;

    EnableKeyRawMode;

    r := sd_event_new(@event);
    if r < 0 then begin
      WriteLn('sd_event_new()  fehler');
      Exit;
    end;

    fd := Create_Socket_fd;

    r := sd_event_add_io(event, nil, fd, EPOLLIN, @io_socket_cp, nil);
    if r < 0 then begin
      WriteLn('sd_event_add_io()  socket fehler');
      Exit;
    end;

    r := sd_event_add_io(event, nil, STDIN_FILENO, EPOLLIN, @io_keyboard_cp, nil);
    if r < 0 then begin
      WriteLn('sd_event_add_io()  keyboard fehler');
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

    DisableKeyRawMode;
  end;

begin
  main;
end.
