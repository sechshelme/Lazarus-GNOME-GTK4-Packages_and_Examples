program project1;

uses
  fp_glib2,
  fp_glib_unix;

type
  Tpasswd = record
    pw_name: pchar;
    pw_passwd: pchar;
    pw_uid: Tgint;
    pw_gid: Tgint;
    pw_gecos: pchar;
    pw_dir: pchar;
    pw_shell: pchar;
  end;
  Ppasswd = ^Tpasswd;

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

    g_printf('%-30s %s'#10, '  Name:', pwd_entry^.pw_name);
    g_printf('%-30s %s'#10, '  Password:', pwd_entry^.pw_passwd);
    g_printf('%-30s %d'#10, '  UID:', pwd_entry^.pw_uid);
    g_printf('%-30s %d'#10, '  GID:', pwd_entry^.pw_gid);
    g_printf('%-30s %s'#10, '  Vollständiger Name:', pwd_entry^.pw_gecos);
    g_printf('%-30s %s'#10, '  Home-Verzeichnis:', pwd_entry^.pw_dir);
    g_printf('%-30s %s'#10, '  Shell:', pwd_entry^.pw_shell);
  end;

begin
  main;
end.
