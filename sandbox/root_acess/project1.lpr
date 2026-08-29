program project1;

uses
  fp_glib2;

  function EnsureRootPrivileges: boolean;
  var
    uname, exe_path: Pgchar;
    err: PGError = nil;
    subprocess: PGSubprocess;
  begin
    uname := g_get_user_name;
    if g_strcmp0(uname, 'root') <> 0 then begin

      exe_path := g_file_read_link('/proc/self/exe', @err);
      if exe_path = nil then begin
        g_printerr('file_read fehlgeschlagen: %s'#10, err^.message);
        g_clear_error(@err);
        Exit(False);
      end;

      subprocess := g_subprocess_new(G_SUBPROCESS_FLAGS_NONE, @err, 'pkexec', exe_path, nil);
      g_free(exe_path);

      if err <> nil then begin
        g_printerr('Fehler beim subprocess start: %s'#10, err^.message);
        g_clear_error(@err);
        Exit(False);
      end;

      g_subprocess_wait(subprocess, nil, @err);
      if g_subprocess_get_if_exited(subprocess) then begin
        if g_subprocess_get_exit_status(subprocess) <> 0 then begin
          g_printf('Es wurde abgebrochen !'#10);
        end;
        g_object_unref(subprocess);
        Exit(False);
      end;
    end else begin
      Exit(True);
    end;
  end;

  procedure main;
  begin
    if EnsureRootPrivileges then begin
      g_printf('Läuft als "root"'#10);
    end else begin
      g_printf('Läuft als normaler user'#10);
    end;
    WriteLn('Programm beendet');
  end;

begin
  main;
end.
