program project1;

// https://en.cppreference.com/w/c/header

uses
  fp_unistd,
  fp_ioctl,
  fp_termios,
  fp_signal,
  fp_stdio;


  procedure Resize_cp(para1: longint); cdecl;
  var
    ws: Twinsize;
  begin
    ioctl(STDIN_FILENO, TIOCGWINSZ, @ws);
    printf('Size: %dx%d'#10, ws.ws_col, ws.ws_row);
  end;

  procedure Ctrl_C_cp(para1: longint); cdecl;
  begin
    printf('<CTRL-C>  gedrückt'#10);
  end;

  procedure SIGSEGV_cp(para1: longint); cdecl;
  const
    cnt: integer = 0;
  begin
    if cnt < 10 then  begin
      printf('SIGSEGV ausgelöst !'#10);
    end;
    Inc(cnt);
  end;

  procedure sighub_cp(para1: longint); cdecl;
  begin
    printf('[x] geklickt'#10);
  end;

  procedure main;
  begin
    {$IFDEF unix}
    WriteLn('SIGRTMIN: ', SIGRTMIN, '   SIGRTMAX: ', SIGRTMAX);
    signal(SIGWINCH, @Resize_cp);
    signal(SIGHUP, @sighub_cp);
    {$ENDIF}

    signal(SIGINT, @Ctrl_C_cp);
    signal(SIGSEGV, @SIGSEGV_cp);
    signal(SIGFPE, @SIGSEGV_cp);

    printf('Hello World %d'#10, 123);
  end;

var
  p: PInteger;

begin

  main;
  readln;
  p^ := 123;
  readln;

end.
