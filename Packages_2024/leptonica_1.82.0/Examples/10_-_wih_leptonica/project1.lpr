program project1;

uses
  fp_lept,
  fp_tesseract;

  procedure PrintLanguage(h: PTessBaseAPI);
  var
    list, p: PPChar;
    ch: pchar;
  begin
    ch := TessBaseAPIGetInitLanguagesAsString(h);
    Write('Language: ');
    if ch = '' then begin
      WriteLn('(none)');
    end else begin
      WriteLn(ch);
    end;

    list := TessBaseAPIGetAvailableLanguagesAsVector(h);
    if list <> nil then begin
      Write('Vefügbar Languages: ');
      p := list;
      while p^ <> nil do begin
        Write(' ', p^);
        Inc(p);
      end;
    end else begin
      Write('(none)');
    end;
  end;

  function InitLanguage(h: PTessBaseAPI; lan: pchar): boolean;
  begin
    Result := True;
    if TessBaseAPIInit3(h, '', lan) <> 0 then begin
      WriteLn('Fehler beim Initialisieren von Tesseract.');
      WriteLn();
      WriteLn('Sprachpaket prüfen');
      WriteLn('  tesseract --list-langs');
      WriteLn('  sudo apt install tesseract-ocr-deu');
      Result := False;
    end;
    PrintLanguage(h);
    WriteLn(#10);
  end;

  procedure main;
  var
    handle: PTessBaseAPI;
    image: PPIX;
    text: pchar;
  begin
    WriteLn('TessVersion:      ', TessVersion);
    WriteLn('LeptonicaVersion: ', getLeptonicaVersion);
    WriteLn();

    image := pixRead('/home/tux/Bilder/Bildschirmfoto vom 2025-01-02 15-56-49.png');
    if image = nil then begin
      WriteLn('Fehler beim Laden des Bildes.');
      Exit;
    end;
    WriteLn('Size: ', pixGetWidth(image), ' x ', pixGetHeight(image));
    WriteLn();

    handle := TessBaseAPICreate;
    if not InitLanguage(handle, 'eng') then  begin
      pixDestroy(@image);
      Exit;
    end;

    TessBaseAPISetImage2(handle, image);

    if TessBaseAPIRecognize(handle, nil) <> 0 then begin
      WriteLn('Fehler bei der Texterkennung.');
      pixDestroy(@image);
      TessBaseAPIDelete(handle);
      Exit;
    end;

    text := TessBaseAPIGetUTF8Text(handle);
    if text <> nil then begin
      WriteLn('Erkannter Text:');
      WriteLn(text);
      TessDeleteText(text);
    end;

    pixDestroy(@image);
    TessBaseAPIEnd(handle);
    TessBaseAPIDelete(handle);
  end;

begin
  main;
end.
