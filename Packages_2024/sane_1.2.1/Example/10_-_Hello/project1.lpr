program project1;

uses
  fp_sane;

  procedure main;
  var
    status: TSANE_Status;
    version_code, len, bytes_read: TSANE_Int;
    device_list: PPSANE_Device;
    i, total: integer;
    params: TSANE_Parameters;
    device: TSANE_Handle;
    buffer: PSANE_Byte;
  begin

    // Libsane initialisieren
    status := sane_init(@version_code, nil);
    if status <> SANE_STATUS_GOOD then begin
      WriteLn('Fehler bei sane_init: ', sane_strstatus(status));
      Exit;
    end;

    // Scanner-Liste abrufen
    status := sane_get_devices(@device_list, SANE_FALSE);
    if status <> SANE_STATUS_GOOD then begin
      WriteLn('Fehler bei sane_get_devices: ', sane_strstatus(status));
      sane_exit;
      Exit;
    end;

    if device_list[0] = nil then begin
      WriteLn('Kein Scanner gefunden');
      sane_exit;
    end;

    // Scanner auflisten
    WriteLn('Verfügbare Scanner:');
    i := 0;

    while device_list[i] <> nil do begin
      WriteLn('Name: ', device_list[i]^.name, '  Model: ', device_list[i]^.model);
      inc(i);
    end;

    // Ersten Scanner öffnen
    status := sane_open(device_list[0]^.name, @device);
    if status <> SANE_STATUS_GOOD then begin
      WriteLn('Fehler bei sane_open: ', sane_strstatus(status));
      sane_exit;
    end;


    // Scan-Parameter abfragen
    status := sane_get_parameters(device, @params);
    if status <> SANE_STATUS_GOOD then begin
      WriteLn('Fehler bei sane_get_parameters: ', sane_strstatus(status));
      sane_close(device);
      sane_exit;
    end;

    WriteLn('Scanauflösung: ', params.depth, 'dpi');
    WriteLn('Scanformat: ', params.pixels_per_line, ' x ', params.lines);

    // Speicher für Bilddaten reservieren
    len := params.bytes_per_line * params.lines;
    buffer := GetMem(len);
    if buffer = nil then begin
      WriteLn('Kein Speicher verfügbar');
      sane_close(device);
      sane_exit;
    end;
    FillChar(buffer[0], len, $FF);
    WriteLn(11111);

    // Scan starten
    status := sane_start(device);
    if status <> SANE_STATUS_GOOD then begin
      WriteLn('Fehler bei sane_start: ', sane_strstatus(status));
      Freemem(buffer);
      sane_close(device);
      sane_exit;
    end;

    // Bilddaten lesen
    total := 0;
    repeat
      status := sane_read(device, buffer + total, len - total, @bytes_read);
      if (status <> SANE_STATUS_GOOD) or (bytes_read = 0) then begin
        break;
      end;
      total := total + bytes_read;
    until total >= len;

    if (status <> SANE_STATUS_EOF) and (status <> SANE_STATUS_GOOD) then begin
      WriteLn('Fehler beim Lesen der Bilddaten: ', sane_strstatus(status));
    end else begin
      WriteLn('Scan erfolgreich, gelesene Bytes: ', total);
    end;

    // Testausgabe
    for i := 0 to total - 1 do begin
      if i mod 255 = 0 then  begin
        Write(buffer[i]: 4);
      end;
    end;
    WriteLn();

    Freemem(buffer);
    sane_close(device);
    sane_exit;
  end;


begin
  main;
end.
