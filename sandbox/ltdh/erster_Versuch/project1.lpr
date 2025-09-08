program project1;

uses
  fp_ltdl,
  lt_dlloader,
  lt_error,
  lt_system;

  procedure main;
  begin
    lt_dlhandle handle;
    double (*cosine)(double);
    const char *error;

    // libltdl initialisieren
    if (lt_dlinit() != 0) {
        fprintf(stderr, "Fehler bei lt_dlinit: %s\n", lt_dlerror());
        return 1;
    }

    // Bibliothek (hier libm.so.6) laden
    handle = lt_dlopen("libm.so.6");
    if (!handle) {
        fprintf(stderr, "Fehler beim Laden der Bibliothek: %s\n", lt_dlerror());
        lt_dlexit();
        return 1;
    }

    // Funktion "cos" aus der Bibliothek holen
    cosine = (double (*)(double))lt_dlsym(handle, "cos");
    if ((error = lt_dlerror()) != NULL) {
        fprintf(stderr, "Fehler beim Finden der Funktion cos: %s\n", error);
        lt_dlclose(handle);
        lt_dlexit();
        return 1;
    }

    // Funktion aufrufen
    printf("cos(2.0) = %f\n", (*cosine)(2.0));

    // Bibliothek schließen und libltdl beenden
    lt_dlclose(handle);
    lt_dlexit();  end;

begin
  main;
end.
