program project1;

uses
  fp_magic;

  procedure main;
  const
    path = 'project1.lpr';
  var
    magic: Tmagic_t;
    mime: pchar;
  begin
    magic := magic_open(MAGIC_MIME_TYPE);
    if magic = nil then  begin
      WriteLn('magic_open fehlgeschlagen');
      Exit;
    end;

    if magic_load(magic, nil) = -1 then begin
      WriteLn('magic_load fehlgeschlagen: ', magic_error(magic));
      magic_close(magic);
      Exit;;
    end;

    mime := magic_file(magic, path);
    if mime = nil then begin
      WriteLn('magic_file fehlgeschlagen: ', magic_error(magic));
    end else begin
      WriteLn('Datei "', path, '": ', mime);
    end;

    magic_close(magic);
  end;

begin
  main;
end.
