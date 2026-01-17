program project1;
uses
  fp_libraw;

const
  path = '/home/tux/Bilder/bild.raw';

  procedure main;
  var
    raw: Plibraw_data_t;
    ret: integer;
  begin
    raw := libraw_init(0);
    if raw = nil then begin
      WriteLn('Fehler bei der Initialisierung von LibRaw');
      Halt(1);
    end;

    ret := libraw_open_file(raw, path);
    if ret <> LIBRAW_SUCCESS then begin
      WriteLn('Fehler beim Laden der Datei: ', libraw_strerror(ret));
      libraw_close(raw);
      Halt(1);
    end;

    ret := libraw_unpack(raw);
    if ret <> LIBRAW_SUCCESS then begin
      WriteLn('Fehler beim Entpacken der RAW-Daten: ', libraw_strerror(ret));
      libraw_close(raw);
      Halt(1);
    end;

    WriteLn('Breite: ', raw^.sizes.width, '  Höhe: ', raw^.sizes.height);

    libraw_close(raw);
  end;

begin
  main;
end.
