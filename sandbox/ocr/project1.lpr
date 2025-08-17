program project1;

uses
   fp_lept,
   fp_tesseract;


procedure main;
var
  handle: PTessBaseAPI;
  image: PPix;
  text: PChar;
begin
  // Tesseract Handle erstellen
  handle := TessBaseAPICreate;

  // Initialisieren (NULL für tessdata path, "eng" für Sprache Englisch)
  if TessBaseAPIInit3(handle, nil, 'deu') <> 0 then begin
      WriteLn('Fehler beim Initialisieren von Tesseract.');
      Exit;
  end;


  // Bilddatei laden (hier PNG), Leptonica Pix wird verwendet
  image := pixRead('/home/tux/Bilder/Bildschirmfoto vom 2025-01-02 15-56-49.png');
  if image =nil then begin
      WriteLn('Fehler beim Laden des Bildes.');
      TessBaseAPIDelete(handle);
      Exit;
  end;

  // Bild für OCR setzen
  TessBaseAPISetImage2(handle, image);

  // OCR ausführen
  if TessBaseAPIRecognize(handle, nil) <> 0  then begin
      WriteLn('Fehler bei der Texterkennung.');
      pixDestroy(@image);
      TessBaseAPIDelete(handle);
      Exit;;
  end;

  // Text auslesen (UTF-8)
  text := TessBaseAPIGetUTF8Text(handle);
  if text<>nil then begin
      WriteLn('Erkannter Text:');
      WriteLn(text);
      TessDeleteText(text);
  end;

  // Aufräumen
  pixDestroy(@image);
  TessBaseAPIEnd(handle);
  TessBaseAPIDelete(handle);
end;

var
  p: Pointer;
begin
//p:=  leptonica_malloc(123);


main;

//gplotstylenames : PPchar;cvar;external libleptb;
//gplotfileoutputs : PPchar;cvar;external libleptb;


end.












// gcc main.c -o main -ltesseract -llept

// sudo apt install libleptonica-dev
// sudo apt install libtesseract-dev

// tesseract --list-langs
// sudo apt install tesseract-ocr
// sudo apt install tesseract-ocr-deu




