program project1;

// journalctl -t example
// journalctl -t example -o verbose


uses
  fp_stdlib,
  fp_unistd,
  fp_systemd;

  procedure main;
  var
    r: longint;
  begin
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
  i: Integer;
begin
  for i:=0 to 100 do
  main;
end.
