unit pam_modules;

interface

uses
  fp_pam, _pam_types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TPam_cleanup_func = procedure(pamh: PPam_handle_t; data: Pointer; error_status: longint); cdecl;

function pam_set_data(pamh: Ppam_handle_t; module_data_name: pchar; data: pointer; cleanup: TPam_cleanup_func): longint; cdecl; external libpam;
function pam_get_data(pamh: Ppam_handle_t; module_data_name: pchar; data: Ppointer): longint; cdecl; external libpam;
function pam_get_user(pamh: Ppam_handle_t; user: PPchar; prompt: pchar): longint; cdecl; external libpam;
function pam_sm_authenticate(pamh: Ppam_handle_t; flags: longint; argc: longint; argv: PPchar): longint; cdecl; external libpam;
function pam_sm_setcred(pamh: Ppam_handle_t; flags: longint; argc: longint; argv: PPchar): longint; cdecl; external libpam;
function pam_sm_acct_mgmt(pamh: Ppam_handle_t; flags: longint; argc: longint; argv: PPchar): longint; cdecl; external libpam;
function pam_sm_open_session(pamh: Ppam_handle_t; flags: longint; argc: longint; argv: PPchar): longint; cdecl; external libpam;
function pam_sm_close_session(pamh: Ppam_handle_t; flags: longint; argc: longint; argv: PPchar): longint; cdecl; external libpam;
function pam_sm_chauthtok(pamh: Ppam_handle_t; flags: longint; argc: longint; argv: PPchar): longint; cdecl; external libpam;

const
  PAM_PRELIM_CHECK = $4000;
  PAM_UPDATE_AUTHTOK = $2000;
  PAM_DATA_REPLACE = $20000000;

  // === Konventiert am: 13-7-25 15:32:02 ===


implementation



end.
