{$IFDEF read_interface}



function pam_start(service_name: pchar; user: pchar; pam_conversation: Ppam_conv; pamh: PPpam_handle_t): longint; cdecl; external libpam;
function pam_start_confdir(service_name: pchar; user: pchar; pam_conversation: Ppam_conv; confdir: pchar; pamh: PPpam_handle_t): longint; cdecl; external libpam;
function pam_end(pamh: Ppam_handle_t; pam_status: longint): longint; cdecl; external libpam;
function pam_authenticate(pamh: Ppam_handle_t; flags: longint): longint; cdecl; external libpam;
function pam_setcred(pamh: Ppam_handle_t; flags: longint): longint; cdecl; external libpam;
function pam_acct_mgmt(pamh: Ppam_handle_t; flags: longint): longint; cdecl; external libpam;
function pam_open_session(pamh: Ppam_handle_t; flags: longint): longint; cdecl; external libpam;
function pam_close_session(pamh: Ppam_handle_t; flags: longint): longint; cdecl; external libpam;
function pam_chauthtok(pamh: Ppam_handle_t; flags: longint): longint; cdecl; external libpam;

// === Konventiert am: 13-7-25 15:31:13 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
