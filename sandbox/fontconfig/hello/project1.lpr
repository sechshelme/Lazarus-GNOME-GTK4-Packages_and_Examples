program project1;

uses
  fp_fontconfig,
  fcfreetype;

  procedure main;
  begin

    if not FcInit then begin
        wrifprintf(stderr, "Fontconfig konnte nicht initialisiert werden\n");
        return 1;
    }

    // Alle auf dem System verfügbaren Fonts abrufen
    FcPattern *pattern = FcPatternCreate();
    FcObjectSet *os = FcObjectSetBuild(FC_FAMILY, FC_STYLE, FC_FILE, NULL);
    FcFontSet *fontset = FcFontList(NULL, pattern, os);

    if (!fontset) {
        fprintf(stderr, "Keine Fonts gefunden\n");
        FcObjectSetDestroy(os);
        FcPatternDestroy(pattern);
        FcFini();
        return 1;
    }

    // Fonts durchlaufen und Informationen ausgeben
    for (int i = 0; i < fontset->nfont; i++) {
        FcPattern *font = fontset->fonts[i];
        FcChar8 *family, *style, *file;

        if (FcPatternGetString(font, FC_FAMILY, 0, &family) == FcResultMatch &&
            FcPatternGetString(font, FC_STYLE, 0, &style) == FcResultMatch &&
            FcPatternGetString(font, FC_FILE, 0, &file) == FcResultMatch) {
            printf("Font: %s, Style: %s, Datei: %s\n", family, style, file);
        }
    }

    // Ressourcen freigeben
    FcFontSetDestroy(fontset);
    FcObjectSetDestroy(os);
    FcPatternDestroy(pattern);
    FcFini();

    return 0;

  end;

begin
  main;
end.
