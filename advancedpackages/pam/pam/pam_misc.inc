{$IFDEF read_interface}


function misc_conv(num_msg: longint; msgm: PPpam_message; response: PPpam_response; appdata_ptr: pointer): longint; cdecl; external libpam_misc;

var
  pam_misc_conv_warn_time: Ttime_t; cvar;external libpam_misc;
  pam_misc_conv_die_time: Ttime_t; cvar;external libpam_misc;
  pam_misc_conv_warn_line: pchar; cvar;external libpam_misc;
  pam_misc_conv_die_line: pchar; cvar;external libpam_misc;
  pam_misc_conv_died: longint; cvar;external libpam_misc;
  pam_binary_handler_fn: function(appdata: pointer; prompt_p: Ppamc_bp_t): longint; cvar;external libpam_misc;
  pam_binary_handler_free: procedure(appdata: pointer; prompt_p: Ppamc_bp_t); cvar;external libpam_misc;

function pam_misc_paste_env(pamh: Ppam_handle_t; user_env: PPchar): longint; cdecl; external libpam_misc;
function pam_misc_drop_env(env: PPchar): PPchar; cdecl; external libpam_misc;
function pam_misc_setenv(pamh: Ppam_handle_t; name: pchar; value: pchar; readonly: longint): longint; cdecl; external libpam_misc;

// === Konventiert am: 13-7-25 15:31:50 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
