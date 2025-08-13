program project1;

uses
  clib,



  fp_socket,
  fp_stdio,
  fp_string,
  fp_stdlib,
  fp_time;



  // gcc main.c -o main

  // nc -l 12345
  // nc -l -k 12345

  // tail -f test.txt



  procedure main;
  const
    message: pchar = 'Hallo Server!'#10;
  var
    sockfd: longint;
    server_addr: Tsockaddr_in;
    f: Tin_addr_t;
  begin
    //    int sockfd;

    // Socket erstellen (AF_INET = IPv4, SOCK_STREAM = TCP)
    sockfd := socket(AF_INET, SOCK_STREAM, 0);
    if sockfd < 0 then begin
      WriteLn('Socket-Erstellung fehlgeschlagen');
      Halt(1);
    end;

    // Serveradresse konfigurieren
    memset(@server_addr, 0, sizeof(server_addr));
    server_addr.sin_family := AF_INET;              // IPv4
    server_addr.sin_port := htons(12345);           // Server-Port, z.B. 12345
    server_addr.sin_addr.s_addr := inet_addr('127.0.0.1'); // Server-IP (localhost)

    // Mit dem Server verbinden
    if connect(sockfd, @server_addr, sizeof(server_addr)) < 0 then begin
      WriteLn('Verbindung zum Server fehlgeschlagen');
      WriteLn('Testverbindung aufbauen mit: "nc -l -k 12345"');
      //   close(sockfd);
      Halt(1);
    end;

    // Nachricht senden
    if send(sockfd, message, strlen(message), 0) < 0 then begin
      WriteLn('Senden fehlgeschlagen');
    end else begin
      WriteLn('Nachricht gesendet: ', message);
    end;

    // Socket schließen
    //    close(sockfd);
  end;

begin
  main;
end.
