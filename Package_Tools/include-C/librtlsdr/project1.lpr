program project1;

// rtl_fm -M fm -f 102.8M -s 200k -l 0 -E deemp | aplay -r 48000 -f S16_LE


uses
  rtl_sdr;

  function printInfo: longint;
  var
    device_count: Tuint32_t;
    i: integer;
    vendor, product, serial: array[0..255] of ansichar;
  begin
    device_count := rtlsdr_get_device_count;
    WriteLn('Device Couint: ', device_count);

    for i := 0 to device_count - 1 do begin
      WriteLn(i: 3, '. ', rtlsdr_get_device_name(i));
      rtlsdr_get_device_usb_strings(i, vendor, product, serial);
      WriteLn('    Hersteller: ', vendor, ' Produkt: ', product, ' Serie: ', serial);
    end;
    WriteLn();
    Exit(device_count);
  end;

  procedure printBuffer;
  const
    DEFAULT_SAMPLE_RATE = 2400000; // 2.4 MHz
//    DEFAULT_FREQ = 100000000;  // 100 MHz
    DEFAULT_FREQ = 102800000;  // 102.8 MHz
    SAMPLE_COUNT = 256 * 1024;// 256k Samples

  var
    dev: Prtlsdr_dev_t;
    device_index: Tuint32_t = 0;
    buffer: pbyte;
    r, n_read, status: longint;

  begin
    // Gerät öffnen
    if rtlsdr_open(@dev, device_index) < 0 then begin
      WriteLn('Konnte RTL-SDR Gerät nicht öffnen !');
      Exit;
    end else begin
      WriteLn('RTL-SDR Open [Ok]');
    end;

    // 1. Mittenfrequenz einstellen (z.B. 100 MHz für UKW-Radio)
    status := rtlsdr_set_center_freq(dev, DEFAULT_FREQ);
    if status < 0 then begin
      WriteLn('Fehler beim Einstellen der Frequenz !');
      rtlsdr_close(dev);
      Exit;
    end else begin
      WriteLn('Set Frequenz [Ok]');
    end;

    // 2. Abtastrate einstellen (z.B. 2.4 MS/s)
    status := rtlsdr_set_sample_rate(dev, DEFAULT_SAMPLE_RATE);
    if status < 0 then begin
      WriteLn('Fehler beim Einstellen der Abstastrate !');
      rtlsdr_close(dev);
      Exit;
    end else begin
      WriteLn('Set Abstastrate [Ok]');
    end;


    // 3. Automatische Verstärkungsregelung (AGC) aktivieren
    status := rtlsdr_set_tuner_gain_mode(dev, 0);
    if status < 0 then begin
      WriteLn('Fehler beim Aktivieren von AGC !');
      rtlsdr_close(dev);
      Exit;
    end else begin
      WriteLn('Set AGC [Ok]');
    end;

    rtlsdr_reset_buffer(dev);

    buffer := GetMem(SAMPLE_COUNT * 2);

    // Samples lesen
    status := rtlsdr_read_sync(dev, buffer, SAMPLE_COUNT * 2, @n_read);
    if status < 0 then begin
      WriteLn('Fehler beim Lesen der Samples.');
    end else begin
      WriteLn(n_read, ' Bytes gelesen. [Ok]');
    end;

    // Aufräumen
    Freemem(buffer);
    rtlsdr_close(dev);
  end;


begin
  if printInfo > 0 then  begin
    printBuffer;
  end;
end.
