program project1;

uses
  fp_lept,
  fp_tesseract;

  procedure PrintLanguage(h: PTessBaseAPI);
  var
    list, p: PPChar;
    ch: PChar;
    i:Integer;
  begin
    ch:=   TessBaseAPIGetInitLanguagesAsString(h);
    WriteLn('ch: ',ch);


    list := TessBaseAPIGetAvailableLanguagesAsVector(h);
    WriteLn('Languages: ');
    if list <> nil then begin
      p := list;
      if p^ = nil then begin
        WriteLn('p = nil');
      end;
      while p^ <> nil do begin
        WriteLn('  ', p^);
        Inc(p);
      end;
    end else begin
      WriteLn('  none');
    end;
    WriteLn();
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


    // Bilddatei laden (hier PNG), Leptonica Pix wird verwendet
    image := pixRead('/home/tux/Bilder/Bildschirmfoto vom 2025-01-02 15-56-49.png');
    if image = nil then begin
      WriteLn('Fehler beim Laden des Bildes.');
      Exit;
    end;
    WriteLn('Size: ', pixGetWidth(image), ' x ', pixGetHeight(image));
    WriteLn();

    // Tesseract Handle erstellen
    handle := TessBaseAPICreate;

    PrintLanguage(handle);



    // Initialisieren (NULL für tessdata path, "eng" für Sprache Englisch)
//    if TessBaseAPIInit3(handle, nil, 'deu') <> 0 then begin
      if TessBaseAPIInit3(handle, '', 'f') <> 0 then begin
      WriteLn('Fehler beim Initialisieren von Tesseract.');
      WriteLn();
      WriteLn('Sprachpaket prüfen');
      WriteLn('  tesseract --list-langs');
      WriteLn('  sudo apt install tesseract-ocr-deu');
      pixDestroy(@image);
//      Exit;
    end;

    PrintLanguage(handle);


    // Bild für OCR setzen
    TessBaseAPISetImage2(handle, image);

    // OCR ausführen
    if TessBaseAPIRecognize(handle, nil) <> 0 then begin
      WriteLn('Fehler bei der Texterkennung.');
      pixDestroy(@image);
      TessBaseAPIDelete(handle);
      Exit;
    end;

    // Text auslesen (UTF-8)
    text := TessBaseAPIGetUTF8Text(handle);
    if text <> nil then begin
      WriteLn('Erkannter Text:');
      WriteLn(text);
      TessDeleteText(text);
    end;

    // Aufräumen
    pixDestroy(@image);
    TessBaseAPIEnd(handle);
    TessBaseAPIDelete(handle);
  end;

begin
  main;
end.
