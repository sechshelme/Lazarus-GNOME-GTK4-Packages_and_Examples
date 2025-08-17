program project1;

uses
  fp_tesseract,
  fp_lept;

  procedure main;
  var
    handle: PTessBaseAPI;
    image: PPix;
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
    WriteLn('Size: ', pixGetWidth(image),' x ',pixGetHeight(image));
    WriteLn();

    // Tesseract Handle erstellen
    handle := TessBaseAPICreate;

    // Initialisieren (NULL für tessdata path, "eng" für Sprache Englisch)
    if TessBaseAPIInit3(handle, nil, 'deu') <> 0 then begin
      WriteLn('Fehler beim Initialisieren von Tesseract.');
      WriteLn();
      WriteLn('Sprachpaket prüfen');
      WriteLn('  tesseract --list-langs');
      WriteLn('  sudo apt install tesseract-ocr-deu');
      pixDestroy(@image);
      Exit;
    end;

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
