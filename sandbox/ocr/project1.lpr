program project1;

uses
   environ,
   pix_,
   array_,
   bbuffer,
   morph,
   bmf,
   ccbord,
   jbclass,
   colorfill,
   stack,
   dewarp,
   rbtree,
   hashmap,
   gplot,
   heap,
   list,


   allheaders,


   fp_lept;

begin
p:=  leptonica_malloc;

//gplotstylenames : PPchar;cvar;external libleptb;
//gplotfileoutputs : PPchar;cvar;external libleptb;


end.












// gcc main.c -o main -ltesseract -llept

// sudo apt install libleptonica-dev
// sudo apt install libtesseract-dev

// tesseract --list-langs
// sudo apt install tesseract-ocr
// sudo apt install tesseract-ocr-deu






#include <stdio.h>
#include <stdlib.h>
#include <leptonica/allheaders.h>  // anstelle von <allheaders.h>
#include <tesseract/capi.h>  // für Tesseract C-API

int main() {
    // Tesseract Handle erstellen
    TessBaseAPI *handle = TessBaseAPICreate();

    // Initialisieren (NULL für tessdata path, "eng" für Sprache Englisch)
    if (TessBaseAPIInit3(handle, NULL, "deu") != 0) {
        fprintf(stderr, "Fehler beim Initialisieren von Tesseract.\n");
        return 1;
    }

    // Bilddatei laden (hier PNG), Leptonica Pix wird verwendet
    PIX *image = pixRead("/home/tux/Bilder/Bildschirmfoto vom 2025-01-02 15-56-49.png");
    if (!image) {
        fprintf(stderr, "Fehler beim Laden des Bildes.\n");
        TessBaseAPIDelete(handle);
        return 1;
    }

    // Bild für OCR setzen
    TessBaseAPISetImage2(handle, image);

    // OCR ausführen
    if (TessBaseAPIRecognize(handle, NULL) != 0) {
        fprintf(stderr, "Fehler bei der Texterkennung.\n");
        pixDestroy(&image);
        TessBaseAPIDelete(handle);
        return 1;
    }

    // Text auslesen (UTF-8)
    char *text = TessBaseAPIGetUTF8Text(handle);
    if (text) {
        printf("Erkannter Text:\n%s\n", text);
        TessDeleteText(text);
    }

    // Aufräumen
    pixDestroy(&image);
    TessBaseAPIEnd(handle);
    TessBaseAPIDelete(handle);

    return 0;
}


