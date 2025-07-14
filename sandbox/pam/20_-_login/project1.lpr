program project1;

uses
  fp_stdlib,
  fp_stdio,
  fp_string,
  fp_unistd,
  fp_grp,
  fp_pwd,
  fp_pam;

  function pam_conv_func(num_msg: longint; msg: PPpam_message; resp: PPpam_response; appdata_ptr: pointer): longint; cdecl;
  var
    i: integer;
    pw: string;
    response: Ppam_response;
  begin
    response := malloc(num_msg * SizeOf(Tpam_response));
    for i := 0 to num_msg - 1 do begin
      case msg[i]^.msg_style of
        PAM_PROMPT_ECHO_OFF: begin
          WriteLn(msg[i]^.msg);
          ReadLn(pw);

          response[i].resp := strdup(pchar(pw));
          response[i].resp_retcode := 0;
        end;
        PAM_PROMPT_ECHO_ON: begin
          WriteLn(msg[i]^.msg);
          ReadLn(pw);

          response[i].resp := strdup(pchar(pw));
          response[i].resp_retcode := 0;
        end;
        else begin
          Exit(PAM_CONV_ERR);
        end;
      end;
    end;
    resp^ := response;
    Result := PAM_SUCCESS;
  end;

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
    //    conv: Tpam_conv = (conv: @pam_conv_func; appdata_ptr: nil);
    conv: Tpam_conv = (conv: @misc_conv; appdata_ptr: nil);
    pam_ret: longint;
    pamh: Ppam_handle_t = nil;
    pw: Ppasswd;
    shell: pchar;
  const
    target_user = 'test';
  begin
    //    pw :=pam_modutil_getpwnam(target_user);
    pw := getpwnam(target_user);
    if pw = nil then begin
      WriteLn('uses failure !');
      Exit;
    end;
    ShowPW(pw);


    pam_ret := pam_start('su', target_user, @conv, @pamh);
    if pam_ret <> PAM_SUCCESS then begin
      WriteLn('pam start failed !', pam_strerror(pamh, pam_ret));
      Exit;
    end;

    pam_ret := pam_authenticate(pamh, 0);
    if pam_ret <> PAM_SUCCESS then begin
      WriteLn('pam authenticate failed !', pam_strerror(pamh, pam_ret));
      pam_end(pamh, pam_ret);
      Exit;
    end;

    pam_ret := pam_acct_mgmt(pamh, 0);
    if pam_ret <> PAM_SUCCESS then begin
      WriteLn('pam konto failed !', pam_strerror(pamh, pam_ret));
      pam_end(pamh, pam_ret);
      Exit;
    end;

    pam_ret := pam_open_session(pamh, 0);
    if pam_ret <> PAM_SUCCESS then begin
      WriteLn('pam session failed !', pam_strerror(pamh, pam_ret));
      pam_end(pamh, pam_ret);
    end;

    if setgid(pw^.pw_gid) <> 0 then begin
      perror('setgid( Fehler)');
      pam_close_session(pamh, 0);
      pam_end(pamh, PAM_SUCCESS);
      Exit;
    end;

    if initgroups(target_user, pw^.pw_gid) <> 0 then begin
      perror('initgroups');
      pam_close_session(pamh, 0);
      pam_end(pamh, PAM_SUCCESS);
      Exit;
    end;
    if setuid(pw^.pw_uid) <> 0 then begin
      perror('setuid');
      pam_close_session(pamh, 0);
      pam_end(pamh, PAM_SUCCESS);
      Exit;
    end;

    //    shell = pw->pw_shell && *pw->pw_shell ? pw->pw_shell : "/bin/sh";
    shell := pw^.pw_shell;
    printf('Starte Shell %s als Benutzer %s'#10, shell, target_user);
    execlp(shell, shell, nil);

    // Sollte nicht erreicht werden
    perror('execlp');
    pam_close_session(pamh, 0);

    pam_end(pamh, PAM_SUCCESS);
  end;

begin
  main;
end.
