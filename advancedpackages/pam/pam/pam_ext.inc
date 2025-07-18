{$IFDEF read_interface}



procedure pam_vsyslog(pamh: Ppam_handle_t; priority: longint; fmt: pchar; args: Tva_list); cdecl; external libpam;
procedure pam_syslog(pamh: Ppam_handle_t; priority: longint; fmt: pchar); cdecl; varargs; external libpam;
function pam_vprompt(pamh: Ppam_handle_t; style: longint; response: PPchar; fmt: pchar; args: Tva_list): longint; cdecl; external libpam;
function pam_prompt(pamh: Ppam_handle_t; style: longint; response: PPchar; fmt: pchar): longint; cdecl; varargs; external libpam;
function pam_get_authtok(pamh: Ppam_handle_t; item: longint; authtok: PPchar; prompt: pchar): longint; cdecl; external libpam;
function pam_get_authtok_noverify(pamh: Ppam_handle_t; authtok: PPchar; prompt: pchar): longint; cdecl; external libpam;
function pam_get_authtok_verify(pamh: Ppam_handle_t; authtok: PPchar; prompt: pchar): longint; cdecl; external libpam;

// === Konventiert am: 13-7-25 15:31:42 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
