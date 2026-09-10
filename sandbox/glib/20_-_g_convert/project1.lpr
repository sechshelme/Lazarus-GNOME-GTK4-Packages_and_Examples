program project1;

uses
  fp_glib2;

  procedure main;
  const
    utf8_text = 'Hallo Welt! Äöüß';
  var
    iso_text: Pgchar;
    bytes_read: Tgsize = 0;
    bytes_written: Tgsize = 0;
    err: PGError = nil;
  begin
    g_printf('Original (UTF-8): %s'#10, utf8_text);

    iso_text := g_convert(utf8_text, -1, 'CP437', 'UTF-8', @bytes_read, @bytes_written, @err);

    if err <> nil then begin
      g_printerr('Fehler bei der Konvertierung: %s'#10, err^.message);
      g_error_free(err);
      Exit;;
    end;

    g_printf('Erfolgreich konvertiert!');
    g_printf('Gelesene Bytes: %lu, Geschriebene Bytes: %lu'#10, bytes_read, bytes_written);

    g_free(iso_text);
  end;

begin
  main;
end.
