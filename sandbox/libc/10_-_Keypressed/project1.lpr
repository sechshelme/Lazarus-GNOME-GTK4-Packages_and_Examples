program project1;

uses
  fcntl_,
  fcntl_bits,
  fcntl_linux,

  fp_stdio,
  fp_unistd,
  fp_termios;


  function kbhit: integer;
  var
    oldt, newt: Ttermios;
    oldf: integer;
    ch: longint;
  begin
    tcgetattr(STDIN_FILENO, @oldt);
    newt := oldt;
    newt.c_lflag := newt.c_lflag and not (ICANON or ECHO);
    tcsetattr(STDIN_FILENO, TCSANOW, @newt);
    oldf := fcntl(STDIN_FILENO, F_GETFL, 0);
    fcntl(STDIN_FILENO, F_SETFL, oldf or O_NONBLOCK);
    ch := getchar();
    tcsetattr(STDIN_FILENO, TCSANOW, @oldt);
    fcntl(STDIN_FILENO, F_SETFL, oldf);
    if ch <> EOF then begin
      ungetc(ch, stdin);
      Exit(1);
    end;
    Exit(0);
  end;

  procedure main;
  begin
    repeat

    until kbhit <> 0;
  end;

begin
  main;
end.
