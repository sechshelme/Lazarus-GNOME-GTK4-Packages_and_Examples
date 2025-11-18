program project1;

uses
  fp_crypt;

const
  key = '$6$randomsalt';

  function FirstPassword: string;
  var
    pw: string;
  begin
    WriteLn('Gib ein Passwort ein:');
    ReadLn(pw);
    Result := crypt(pchar(pw), key);
  end;

  function NextPassword: string;
  var
    pw: string;
  begin
    WriteLn('Gib das Passwort nochmlas ein:');
    ReadLn(pw);
    Result := crypt(pchar(pw), key);
  end;

  procedure main;
  var
    first_hash, next_hash: string;
  begin
    first_hash := FirstPassword;
    WriteLn(first_hash);
    next_hash := NextPassword;

    if next_hash = first_hash then begin
      WriteLn('Passwort Kontrolle io.');
    end else begin
      WriteLn('Passworter sind ungleich');
    end;
  end;

begin
  main;
end.
