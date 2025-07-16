program project1;

uses
  fp_stdio,
  fp_unistd,
  fp_termios;

const
  MAX_PASSWD_LEN = 100;

  procedure get_password(password: pchar; max_len: SizeInt);
  var
    oldt, newt: Ttermios;
    len: SizeInt;
  begin
    printf('Bitte Passwort eingeben'#10);
    fflush(stdout);
    tcgetattr(STDIN_FILENO, @oldt);

    WriteLn('size: ', SizeOf(oldt));

    newt := oldt;
    newt.c_lflag := newt.c_lflag and not ECHO;

    tcsetattr(STDIN_FILENO, TCSANOW, @newt);

    fgets(password, max_len, stdin);

    tcsetattr(STDIN_FILENO, TCSANOW, @oldt);
    printf(#10);

    len := Length(password);
    WriteLn(len);
    if (len > 0) and (password[len - 1] = #10) then begin
      password[len - 1] := #0;
    end;
  end;

  procedure main;
  var
    password: array[0..MAX_PASSWD_LEN - 1] of char;
  begin
    get_password(password, SizeOf(password));

    WriteLn(password);
  end;

begin
  main;
end.
