program project1;

uses
  fp_stdlib,
  fp_stdio,
  fp_string,
  fp_unistd,
  fp_grp,
  fp_pwd;

  procedure ShowPW(pw: Ppasswd);
  begin
    with pw^ do begin
      writeLn('pw_name:   ', pw_name);
      writeLn('pw_passwd: ', pw_passwd);
      writeLn('pw_uid:    ', pw_uid);
      writeLn('pw_gid:    ', pw_gid);
      writeLn('pw_gecos:  ', pw_gecos);
      writeLn('pw_dir:    ', pw_dir);
      writeLn('pw_shell:  ', pw_shell);
    end;
  end;

  procedure main;
  var
    pw: Ppasswd;
    shell: pchar;
  const
    target_user = 'test';
  begin
    pw := getpwnam(target_user);
    if pw = nil then begin
      WriteLn('uses failure !');
      Exit;
    end;
    ShowPW(pw);

    // Funktioniert nur als root !
    if setgid(pw^.pw_gid) <> 0 then begin
      perror('setgid() failed');
      Exit;
    end;

    if initgroups(target_user, pw^.pw_gid) <> 0 then begin
      perror('initgroups() failed');
      Exit;
    end;
    if setuid(pw^.pw_uid) <> 0 then begin
      perror('setuid() failed');
      Exit;
    end;

    //    shell = pw->pw_shell && *pw->pw_shell ? pw->pw_shell : "/bin/sh";
    shell := pw^.pw_shell;
    printf('Starte Shell %s als Benutzer %s'#10, shell, target_user);
    execlp(shell, shell, nil);

    perror('execlp');
  end;

begin
  main;
end.
