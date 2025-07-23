program project1;

// journalctl -t example
// journalctl -t example -o verbose

// journalctl -p err
// journalctl -f -p err




uses
  fp_stdlib,
  fp_unistd,
  clib,
  fp_systemd;

  procedure Read_Journal;
  var
    j: Psd_journal;
    data: Pointer;
    length: Tsize_t;
    counter:Integer=0;
  begin
    // 1. Journal öffnen (nur lokale Logs)
    if sd_journal_open(@j, SD_JOURNAL_LOCAL_ONLY) < 0 then begin
      WriteLn('Konte Journal nicht öffnen');
    end;

    // Nur ERROR-Level-Einträge (PRIORITY=3)
//    sd_journal_add_match(j,PChar( 'PRIORITY=3'), 0);

    // 2. Filter setzen (nur Logs mit SYSLOG_IDENTIFIER=example)
//    sd_journal_add_match(j, pchar('SYSLOG_IDENTIFIER=example'), 0);

    // 3. Zum Anfang des Journals gehen (oder sd_journal_seek_tail for zuletzt)
    sd_journal_seek_head(j);

    // 4. Iterieren
    while sd_journal_next(j) > 0 do begin
      WriteLn(counter);
      if sd_journal_get_data(j, 'MESSAGE', @data, @length) = 0 then begin
        WriteLn(length: 4, '.  ', pchar(data));
      end;

      if sd_journal_get_data(j, 'ERRNO', @data, @length) = 0 then begin
        WriteLn(length: 4, '.  ', pchar(data));
      end;
      inc(counter);
    end;

    // 5. Aufräumen
    sd_journal_close(j);
  end;

  procedure main;
  var
    r: longint;
  begin
    Read_Journal;

    sd_journal_perror('Es trat ein Fehler aus !');


    r := sd_journal_send(
      'MESSAGE=Hallo, das ist eine Testnachricht vom sd_journal_send Beispiel!',
      'PRIORITY=6',
      'SYSLOG_IDENTIFIER=example',
      'MY_CUSTOM_FIELD=Beispielwert',
      'USER=%s',
      getenv('USER'),
      'PID=%i',
      getpid(),
      nil);

    if r < 0 then begin
      WriteLn('Fehler');
    end;
    WriteLn(getpid);
  end;

var
  i: integer;
begin
  main;
end.
