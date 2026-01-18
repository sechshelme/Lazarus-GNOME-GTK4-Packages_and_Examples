program project1;

//
// Für mehr Sessionen:
//   ssh tux@localhost
//


uses
  fp_stdlib,
  fp_unistd,
  clib,
  fp_pidfd,
  fp_systemd;

  procedure main;
  var
    monitor: Psd_login_monitor = nil;
    r: longint;
    uid: Tuid_t;
    sessions: PPChar = nil;
    p: PPChar;
  begin
    r := sd_login_monitor_new(nil, @monitor);
    if r < 0 then begin
      WriteLn('Fehler beim Anlegen des Login-Monitors: ', r);
      Halt(1);
    end;

    WriteLn('Login-Monitor erfolgreich angelegt.');

    uid := getuid;

    r := sd_uid_get_sessions(uid, 0, @sessions);
    if r < 0 then begin
      WriteLn('Fehler beim Abrufen der Sitzungen für UID ', uid, ': ', r);
      sd_login_monitor_unref(monitor);
      Halt(1);
    end;

    WriteLn('Sitzungen für UID ', uid);
    p := sessions;
    if p <> nil then begin
      while p^ <> nil do begin
        WriteLn('  Session: ', p^);
        Inc(p);
      end;
    end;

    p := sessions;
    if p <> nil then begin
      while p^ <> nil do begin
        free(p^);
        Inc(p);
      end;
      free(sessions);
    end;
    sd_login_monitor_unref(monitor);
  end;

begin
  main;
end.
