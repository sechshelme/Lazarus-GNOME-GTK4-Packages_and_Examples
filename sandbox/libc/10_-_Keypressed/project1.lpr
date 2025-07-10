program project1;

uses
  fp_fcntl,

  fp_stdio,
  fp_unistd,
  fp_termios;


  function Keypressed: boolean;
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
      Exit(True);
    end;
    Exit(False);
  end;

  procedure main;
  var
    Quit: boolean = False;
    ch: longint=0;
  begin
//    printf(#27'[?1000h');   // Mouse click
    printf(#27'[?1003h');   // Mouse move

    printf('Taste = Abbruch'#10);
    repeat
      if Keypressed then begin
        ch := getchar;
        WriteLn(ch);
      end;

      usleep(10000);
      printf('.');

//      until ch=27;
      until False;
  end;

begin
  main;
end.
