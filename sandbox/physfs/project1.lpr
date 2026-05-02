program project1;

uses
fp_physfs;

procedure main;
begin
      // 1. PhysicsFS initialisieren
    // argv[0] hilft der Lib, den Pfad der ausführbaren Datei zu finden
    if (!PHYSFS_init(argv[0])) {
        fprintf(stderr, "Fehler beim Initialisieren: %s\n", PHYSFS_getErrorByCode(PHYSFS_getLastErrorCode()));
        return 1;
    }

    // 2. Ein ZIP-Archiv oder ein Verzeichnis zum Suchpfad hinzufügen
    // Das zweite Argument '1' hängt es an das Ende des Suchpfads an
    if (!PHYSFS_mount("/home/tux/Downloads/live-chart-master.zip", "/test", 1)) {
        printf("Konnte daten.zip nicht mounten: %s\n", PHYSFS_getErrorByCode(PHYSFS_getLastErrorCode()));
    }

    // 3. Eine Datei zum Lesen öffnen (Pfad ist relativ zum Mount-Punkt)
    PHYSFS_File* file = PHYSFS_openRead("test/live-chart-master/README.md");
    if (file == NULL) {
        printf("Datei nicht gefunden: %s\n", PHYSFS_getErrorByCode(PHYSFS_getLastErrorCode()));
    } else {
        // Dateigrösse bestimmen
        PHYSFS_sint64 fileLen = PHYSFS_fileLength(file);
        char *buffer = (char *)malloc(fileLen + 1);

        // Daten lesen
        PHYSFS_sint64 readLen = PHYSFS_readBytes(file, buffer, fileLen);
        buffer[readLen] = '\0'; // Null-Terminator für C-Strings

        printf("Inhalt der Datei:\n%s\n", buffer);

        free(buffer);
        PHYSFS_close(file);
    }

// Dateien im Root ("/") auflisten
char **rc = PHYSFS_enumerateFiles("test/live-chart-master");
char **i;

for (i = rc; *i != NULL; i++) {
    printf("Gefunden: %s\n", *i);
}

// WICHTIG: Den von PhysicsFS reservierten Speicher wieder freigeben
PHYSFS_freeList(rc);


    // 4. Aufräumen
    PHYSFS_deinit();
end;
begin
   main;
end.

