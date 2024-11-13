program project1;

uses
  ctypes,
  fp_glib2,
  fp_glib_unix;

  // https://www.perplexity.ai/search/was-ist-bei-dieser-funktion-pa-R7sZ7u8bSkmRsWbUMWKsJg

  procedure main;
  const
    username = 'tux';
  var
    err: PGError = nil;
    pwd_entry: Ppasswd;
  begin
    pwd_entry := g_unix_get_passwd_entry(username, @err);
    if pwd_entry = nil then  begin
      g_print('Fehler beim Abrufen der Benutzerinformationen: %s'#10, err^.message);
      g_error_free(err);
      Exit;
    end;

    g_print('  Name: %s'#10, pwd_entry^.pw_name);
    g_print('  Password: %s'#10, pwd_entry^.pw_passwd);
    g_print('  UID: %d'#10, pwd_entry^.pw_uid);
    g_print('  GID: %d'#10, pwd_entry^.pw_gid);
    g_print('  Vollständiger Name: %s'#10, pwd_entry^.pw_gecos);
    g_print('  Home-Verzeichnis: %s'#10, pwd_entry^.pw_dir);
    g_print('  Shell: %s'#10, pwd_entry^.pw_shell);
  end;

begin
  main;
end.
