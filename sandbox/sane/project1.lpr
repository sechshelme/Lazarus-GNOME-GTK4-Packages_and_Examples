program project1;
uses
  fp_sane,
  saneopts;

procedure main;
begin
  //SANE_Status status;
  //SANE_Int version_code;
  //const SANE_Device **device_list;
  //SANE_Handle device;
  //SANE_Parameters params;
  //SANE_Int length;
  //void *buffer;
  //
  //// Libsane initialisieren
  //status = sane_init(&version_code, NULL);
  //if (status != SANE_STATUS_GOOD) {
  //    fprintf(stderr, "Fehler bei sane_init: %s\n", sane_strstatus(status));
  //    return 1;
  //}
  //
  //// Scanner-Liste abrufen
  //status = sane_get_devices(&device_list, SANE_FALSE);
  //if (status != SANE_STATUS_GOOD) {
  //    fprintf(stderr, "Fehler bei sane_get_devices: %s\n", sane_strstatus(status));
  //    sane_exit();
  //    return 1;
  //}
  //
  //if (device_list[0] == NULL) {
  //    fprintf(stderr, "Kein Scanner gefunden\n");
  //    sane_exit();
  //    return 1;
  //}
  //
  //// Scanner auflisten
  //printf("Verfügbare Scanner:\n");
  //for (int i = 0; device_list[i] != NULL; i++) {
  //    printf("Name: %s\nModel: %s\n\n", device_list[i]->name, device_list[i]->model);
  //}
  //
  //printf("Gefundener Scanner: %s - %s\n", device_list[0]->name, device_list[0]->model);
  //
  //// Ersten Scanner öffnen
  //status = sane_open(device_list[0]->name, &device);
  //if (status != SANE_STATUS_GOOD) {
  //    fprintf(stderr, "Fehler bei sane_open: %s\n", sane_strstatus(status));
  //    sane_exit();
  //    return 1;
  //}
  //
  //// Scan-Parameter abfragen
  //status = sane_get_parameters(device, &params);
  //if (status != SANE_STATUS_GOOD) {
  //    fprintf(stderr, "Fehler bei sane_get_parameters: %s\n", sane_strstatus(status));
  //    sane_close(device);
  //    sane_exit();
  //    return 1;
  //}
  //
  //printf("Scanauflösung: %d dpi\n", params.depth);
  //printf("Scanformat: %d x %d\n", params.pixels_per_line, params.lines);
  //
  //// Speicher für Bilddaten reservieren
  //length = params.bytes_per_line * params.lines;
  //buffer = malloc(length);
  //if (!buffer) {
  //    fprintf(stderr, "Kein Speicher verfügbar\n");
  //    sane_close(device);
  //    sane_exit();
  //    return 1;
  //}
  //
  //// Scan starten
  //status = sane_start(device);
  //if (status != SANE_STATUS_GOOD) {
  //    fprintf(stderr, "Fehler bei sane_start: %s\n", sane_strstatus(status));
  //    free(buffer);
  //    sane_close(device);
  //    sane_exit();
  //    return 1;
  //}
  //
  //// Bilddaten lesen
  //SANE_Int bytes_read;
  //int total = 0;
  //while ((status = sane_read(device, (char*)buffer + total, length - total, &bytes_read)) == SANE_STATUS_GOOD && bytes_read > 0) {
  //    total += bytes_read;
  //    if (total >= length) break;
  //}
  //
  //if (status != SANE_STATUS_EOF && status != SANE_STATUS_GOOD) {
  //    fprintf(stderr, "Fehler beim Lesen der Bilddaten: %s\n", sane_strstatus(status));
  //} else {
  //    printf("Scan erfolgreich, gelesene Bytes: %d\n", total);
  //}
  //
  //// Scan-Daten als PNM-Datei speichern (Graustufen)
  //FILE *f = fopen("scan.pnm", "wb");
  //if (f) {
  //    fprintf(f, "P5\n%d %d\n255\n", params.pixels_per_line, params.lines);
  //    fwrite(buffer, 1, total, f);
  //    fclose(f);
  //    printf("Scan wurde in scan.pnm gespeichert\n");
  //} else {
  //    fprintf(stderr, "Fehler beim Öffnen der Ausgabedatei\n");
  //}
  //
  //free(buffer);
  //sane_close(device);
  //sane_exit();
  //
end;


begin
  main;
end.

