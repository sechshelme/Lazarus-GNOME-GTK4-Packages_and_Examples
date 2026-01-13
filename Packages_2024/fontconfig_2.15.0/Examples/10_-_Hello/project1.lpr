program project1;

uses
  fp_fontconfig;

  procedure main;
  var
    pattern, font: PFcPattern;
    os: PFcObjectSet;
    fontset: PFcFontSet;
    i: integer;
    family, style, file_: pchar;
  begin
    WriteLn('Version: ', FC_MAJOR, '.', FC_MINOR, '.', FC_REVISION);

    if not FcInit then begin
      WriteLn('Fontconfig konnte nicht initialisiert werden');
      Halt(1);
    end;

    pattern := FcPatternCreate;
    os := FcObjectSetBuild(FC_FAMILY, FC_STYLE, FC_FILE, nil);
    fontset := FcFontList(nil, pattern, os);

    if fontset = nil then begin
      WriteLn('Keine Fonts gefunden');
      FcObjectSetDestroy(os);
      FcPatternDestroy(pattern);
      FcFini;
      Halt(1);
    end;

    for  i := 0 to fontset^.nfont - 1 do begin
      font := fontset^.fonts[i];
      if (FcPatternGetString(font, FC_FAMILY, 0, @family) = FcResultMatch) and
        (FcPatternGetString(font, FC_STYLE, 0, @style) = FcResultMatch) and
        (FcPatternGetString(font, FC_FILE, 0, @file_) = FcResultMatch) then begin
        WriteLn('Font: ', family, ' Style: ', style, ' Datei: ', file_);
      end;
    end;
    WriteLn('Total Fonts: ', fontset^.nfont);

    FcFontSetDestroy(fontset);
    FcObjectSetDestroy(os);
    FcPatternDestroy(pattern);
    FcFini;
  end;

begin
  main;
end.
