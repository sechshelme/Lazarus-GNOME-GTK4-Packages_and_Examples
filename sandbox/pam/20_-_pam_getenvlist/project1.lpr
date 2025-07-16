program project1;

uses
  fp_stdio,
  fp_stdlib,
  fp_string,
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

  procedure PrintEnv(pamh: Ppam_handle_t);
  var
    envlist, ev: PPChar;
  begin
    envlist := pam_getenvlist(pamh);
    WriteLn('Ev List: ');
    if envlist <> nil then begin
      ev := envlist;
      while ev^ <> nil do begin
        WriteLn('  ', ev^);
        free(ev^);
        Inc(ev);
      end;
      free(envlist);
    end;
  end;

  procedure PrintItems(pamh: Ppam_handle_t);
  var
    item: Pointer;
  begin
    printf('Items: ');
    pam_get_item(pamh, PAM_SERVICE, @item);
    printf('  PAM_SERVICE: %s'#10, item);

    pam_get_item(pamh, PAM_USER, @item);
    printf('  PAM_USER: %s'#10, item);

    pam_get_item(pamh, PAM_TTY, @item);
    printf('  PAM_TTY: %s'#10, item);

    pam_get_item(pamh, PAM_RHOST, @item);
    printf('  PAM_RHOST: %s'#10, item);

    pam_get_item(pamh, PAM_AUTHTOK, @item);
    printf('  PAM_AUTHTOK: %s'#10, item);

    pam_get_item(pamh, PAM_RUSER, @item);
    printf('  PAM_RUSER: %s'#10, item);

    pam_get_item(pamh, PAM_USER_PROMPT, @item);
    printf('  PAM_USER_PROMPT: %s'#10, item);

    pam_get_item(pamh, PAM_FAIL_DELAY_, @item);
    printf('  PAM_FAIL_DELAY_: %d'#10, item);

    pam_get_item(pamh, PAM_XDISPLAY, @item);
    printf('  PAM_XDISPLAY: %s'#10, item);
  end;

  function CheckLogin: boolean;
  var
    conv: Tpam_conv = (conv: @pam_conv_func; appdata_ptr: nil);
    retval: longint;
    pamh: Ppam_handle_t = nil;
  begin
    retval := pam_start('login', nil, @conv, @pamh);
    if retval <> PAM_SUCCESS then begin
      WriteLn('pam_start() failed !');
      Exit(False);
    end;

    retval := pam_authenticate(pamh, 0);
    if retval <> PAM_SUCCESS then begin
      WriteLn('pam_authenticate() failed !');
      pam_end(pamh, retval);
      Exit(False);
    end;

    retval := pam_acct_mgmt(pamh, 0);
    if retval <> PAM_SUCCESS then begin
      WriteLn('pam_acct_mgmt() failed !');
      pam_end(pamh, retval);
      Exit(False);
    end;

    retval := pam_open_session(pamh, 0);
    if retval <> PAM_SUCCESS then begin
      WriteLn('pam_open_session() failed !');
      pam_end(pamh, retval);
      Exit(False);
    end;

    PrintItems(pamh);
    PrintEnv(pamh);

    retval := pam_close_session(pamh, 0);
    if retval <> PAM_SUCCESS then begin
      WriteLn('pam_close_session()  failed !');
      pam_end(pamh, retval);
      Exit(False);
    end;

    pam_end(pamh, PAM_SUCCESS);
    Exit(True);
  end;

  procedure main;
  begin
    if CheckLogin then begin
      WriteLn('Login io. Funktion darf ausgeführt werden');
    end else begin
      WriteLn('Login falsch');
    end;
  end;

begin
  main;
end.
