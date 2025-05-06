program project1;

// https://en.cppreference.com/w/c/header

// /usr/include/asm-generic/signal.h


// https://www.perplexity.ai/search/was-gibt-es-fur-standard-heade-mgrBB3i0Qra8x6wkP2tawQ

// https://www.perplexity.ai/search/das-ist-echt-komisch-mit-dem-s-DYKAX_A1RT6MgsLLEnUlhA

uses
  BaseUnix,
  Unix,

  signal,
  stdio,
  clib;


const
  STDIN_FILENO = 0;//  /* Standard input.  */
  STDOUT_FILENO = 1;//  /* Standard output.  */
  STDERR_FILENO = 2;//  /* Standard error output.  */

  TIOCGWINSZ = $5413;
  TIOCSWINSZ = $5414;

  SIGWINCH = 28; //  /* Window size change (4.3 BSD, Sun).  */

  procedure Resize_cp(para1: longint); cdecl;
  type
    Twinsize = record
    ws_row, ws_col, ws_xpixel, ws_ypixel: cshort;
  end;
  var
    ws: Twinsize;
  begin
    FpIOCtl(STDIN_FILENO, TIOCGWINSZ, @ws);
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

  procedure main;
  begin
    WriteLn('SIGRTMIN: ', SIGRTMIN, '   SIGRTMAX: ', SIGRTMAX);

    signal.signal(SIGWINCH, @Resize_cp);
    signal.signal(SIGINT, @Ctrl_C_cp);
    signal.signal(SIGSEGV, @SIGSEGV_cp);
//    signal(SIGFPE, handler);  divisio by zero

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
