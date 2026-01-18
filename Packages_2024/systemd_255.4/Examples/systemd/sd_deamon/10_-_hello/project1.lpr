program project1;


// systemctl --user start example.service

// systemctl --user daemon-reload
// systemctl --user restart example.service

// systemctl --user status example.service
// journalctl --user -u example.service -f


// Folgende Datei erstellen ~/.config/systemd/user/example.service
(*
[Unit]
Description=Testservice mit Lazarus Example

[Service]
Type=simple
ExecStart=/n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/GNOME/sandbox/systemd/sd_deamon/10_-_hello/project1
WatchdogSec=10s
Restart=on-failure

[Install]
WantedBy=default.target
*)

uses
  fp_unistd,
  fp_systemd;

  procedure main;
  var
    watchdog_usec: uint64 = 0;
    counter: integer = 0;
  begin
    if sd_booted = 0 then begin
      WriteLn('Systemd läuft nicht als Init');
      Halt(1);
    end else begin
      WriteLn('Systemd erkannt');
    end;

    if sd_watchdog_enabled(0, @watchdog_usec) > 0 then begin
      WriteLn('Watchdog aktiviert mit Intervall ', watchdog_usec / 1e6: 4: 2);
    end else begin
      WriteLn('Kein Watchdog aktiviert');
    end;

    if sd_notify(0, 'READY=1') < 0 then begin
      WriteLn('sd_notify failed');
      Halt(1);
    end else begin
      WriteLn('READY=1 an systemd gesendet');
    end;

    while True do begin
      if watchdog_usec > 0 then begin
        if sd_notify(0, 'WATCHDOG=1') < 0 then begin
          WriteLn('WATCHDOG notify failed');
        end else begin
          WriteLn('WATCHDOG=1 gesendet');
        end;
        usleep(watchdog_usec div 2);
      end else begin
        WriteLn('Keine Watchdog-Funktion, schlaf...');
        sleep(5);
      end;

      Inc(counter);
      if counter >= 3 then begin
        repeat
          sleep(1);
          WriteLn('Programm hängt');
        until False;
      end;
    end;
  end;

begin
  main;
end.
