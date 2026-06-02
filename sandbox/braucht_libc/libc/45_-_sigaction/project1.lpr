program project1;

// https://en.cppreference.com/w/c/header

uses
  fp_unistd,
  fp_ioctl,
  fp_termios,
  fp_signal,
  fp_stdio,
  clib;


  procedure Ctrl_C_cp(para1: longint); cdecl;
  begin
    printf('Variante 1 <CTRL-C>  gedrückt'#10);
  end;

  procedure Ctrl_C_2(signum: longint; info: Psiginfo_t; context: Pointer); cdecl;
  begin
    printf('Variante 2 <CTRL-C>  gedrückt'#10);
    psiginfo(info, 'Signal empfangen');
  end;

  procedure main;
  var
    sa: Tsigaction;
  begin
    FillChar(sa, SizeOf(sa),0);

//    sa.sa_handler := @Ctrl_C_cp;
//    sa.sa_flags := 0;
//    sigemptyset(@sa.sa_mask);
    //    sigaction(SIGINT, @sa, nil);

    WriteLn('Drücke <Ctrl+C>');


    sa.sa_sigaction := @Ctrl_C_2;
    sa.sa_flags := SA_SIGINFO;
    sigaction(SIGINT, @sa, nil);

    WriteLn('diff 1: ', PtrInt(@sa.sa_flags) - PtrInt(@sa));
//    WriteLn('diff 1: ', PtrInt(@sa.sa_flags2) - PtrInt(@sa));



    repeat
    until False;
  end;

begin
  main;
end.
