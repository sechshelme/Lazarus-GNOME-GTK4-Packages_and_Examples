program project1;

uses
  fp_stdlib,
  fp_string,
  fp_strings,
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

  procedure main;
  var
    conv: Tpam_conv = (conv: @pam_conv_func; appdata_ptr: nil);
    retval: longint;
    pamh: Ppam_handle_t = nil;
  begin
    retval := pam_start('login', nil, @conv, @pamh);
    if retval <> PAM_SUCCESS then begin
      WriteLn('pam start failed !');
      Exit;
    end;

    retval := pam_authenticate(pamh, 0);
    if retval <> PAM_SUCCESS then begin
      WriteLn('pam authenticate failed !');
      pam_end(pamh, retval);
      Exit;
    end;

    WriteLn('Login [ok]');
    WriteLn('Es darf etwas für diesen Benutzer ausgführt werden');

    pam_end(pamh, PAM_SUCCESS);
  end;



begin
  main;
end.
