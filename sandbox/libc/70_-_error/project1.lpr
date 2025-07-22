program project1;

uses
  fp_error,
  fp_errno,
  fp_stdio,
  clib;

  procedure main;
  var
    fp: PFILE;
  begin
    WriteLn(#10);
    error_at_line(0, 0, 'Hello', 123, 'Es gabe ein Fehler');

    fp := fopen('blublu.txt', 'r');
    if fp = nil then begin
      error(1, errno, 'Konnte Datei nicht öffnen');
    end else begin
      fclose(fp);
    end;
  end;

begin
  main;
end.
