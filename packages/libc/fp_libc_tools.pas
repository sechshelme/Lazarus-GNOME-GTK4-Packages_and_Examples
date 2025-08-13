unit fp_libc_tools;

interface

uses
  fp_termios, fp_unistd, fp_stdio;

procedure EnableKeyRawMode;
procedure DisableKeyRawMode;

procedure TextColor(color: byte);
procedure GotoXY(x, y: integer);
procedure ClrScr;
procedure CursorHiden;
procedure CursorShow;


implementation

// === KeyBoard

var
  oldterm: Ttermios;

procedure EnableKeyRawMode;
var
  newterm: Ttermios;
begin
  tcgetattr(STDIN_FILENO, @oldterm);
  newterm := oldterm;
  newterm.c_lflag := newterm.c_lflag and not (ICANON or ECHO);
  tcsetattr(STDIN_FILENO, TCSANOW, @newterm);
end;

procedure DisableKeyRawMode;
begin
  tcsetattr(STDIN_FILENO, TCSANOW, @oldterm);
end;

// === Screen

procedure TextColor(color: byte);
begin
  if color < 8 then begin
    printf(#27'[%dm', 30 + color);
  end else begin
    printf(#27'[%dm', 90 + (color - 8) );
  end;
  fflush(stdout);
end;

procedure GotoXY(x, y: integer);
begin
  printf(#27'[%d;%dH',y,x);
  fflush(stdout);
end;

procedure ClrScr;
begin
  printf(#27'[2J'#27'[H');
  fflush(stdout);
end;

procedure CursorHiden;
begin
  printf(#27'[?25l');
  fflush(stdout);
end;

procedure CursorShow;
begin
  printf(#27'[?25h');
  fflush(stdout);
end;

end.
