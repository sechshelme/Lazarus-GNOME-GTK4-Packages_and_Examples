{$IFDEF read_interface}


type
  Tpam_handle_t = record
  end;
  Ppam_handle_t = ^Tpam_handle_t;
  PPpam_handle_t = ^Ppam_handle_t;

const
  PAM_SUCCESS = 0;
  PAM_OPEN_ERR = 1;
  PAM_SYMBOL_ERR = 2;
  PAM_SERVICE_ERR = 3;
  PAM_SYSTEM_ERR = 4;
  PAM_BUF_ERR = 5;
  PAM_PERM_DENIED = 6;
  PAM_AUTH_ERR = 7;
  PAM_CRED_INSUFFICIENT = 8;
  PAM_AUTHINFO_UNAVAIL = 9;
  PAM_USER_UNKNOWN = 10;
  PAM_MAXTRIES = 11;
  PAM_NEW_AUTHTOK_REQD = 12;
  PAM_ACCT_EXPIRED = 13;
  PAM_SESSION_ERR = 14;
  PAM_CRED_UNAVAIL = 15;
  PAM_CRED_EXPIRED = 16;
  PAM_CRED_ERR = 17;
  PAM_NO_MODULE_DATA = 18;
  PAM_CONV_ERR = 19;
  PAM_AUTHTOK_ERR = 20;
  PAM_AUTHTOK_RECOVERY_ERR = 21;
  PAM_AUTHTOK_LOCK_BUSY = 22;
  PAM_AUTHTOK_DISABLE_AGING = 23;
  PAM_TRY_AGAIN = 24;
  PAM_IGNORE = 25;
  PAM_ABORT = 26;
  PAM_AUTHTOK_EXPIRED = 27;
  PAM_MODULE_UNKNOWN = 28;
  PAM_BAD_ITEM = 29;
  PAM_CONV_AGAIN = 30;
  PAM_INCOMPLETE = 31;
  _PAM_RETURN_VALUES = 32;

  PAM_SILENT = $8000;
  PAM_DISALLOW_NULL_AUTHTOK = $0001;
  PAM_ESTABLISH_CRED = $0002;
  PAM_DELETE_CRED = $0004;
  PAM_REINITIALIZE_CRED = $0008;
  PAM_REFRESH_CRED = $0010;
  PAM_CHANGE_EXPIRED_AUTHTOK = $0020;

  PAM_SERVICE = 1;
  PAM_USER = 2;
  PAM_TTY = 3;
  PAM_RHOST = 4;
  PAM_CONV = 5;
  PAM_AUTHTOK = 6;
  PAM_OLDAUTHTOK = 7;
  PAM_RUSER = 8;
  PAM_USER_PROMPT = 9;
  PAM_FAIL_DELAY_ = 10;
  PAM_XDISPLAY = 11;
  PAM_XAUTHDATA = 12;
  PAM_AUTHTOK_TYPE = 13;

function PAM_GNUC_PREREQ(maj, min: longint): longint;

function pam_set_item(pamh: Ppam_handle_t; item_type: longint; item: pointer): longint; cdecl; external libpam;
function pam_get_item(pamh: Ppam_handle_t; item_type: longint; item: Ppointer): longint; cdecl; external libpam;
function pam_strerror(pamh: Ppam_handle_t; errnum: longint): pchar; cdecl; external libpam;
function pam_putenv(pamh: Ppam_handle_t; name_value: pchar): longint; cdecl; external libpam;
function pam_getenv(pamh: Ppam_handle_t; name: pchar): pchar; cdecl; external libpam;
function pam_getenvlist(pamh: Ppam_handle_t): PPchar; cdecl; external libpam;

const
  PAM_DATA_SILENT = $40000000;

function pam_fail_delay(pamh: Ppam_handle_t; musec_delay: dword): longint; cdecl; external libpam;

const
  PAM_PROMPT_ECHO_OFF = 1;
  PAM_PROMPT_ECHO_ON = 2;
  PAM_ERROR_MSG = 3;
  PAM_TEXT_INFO = 4;
  PAM_RADIO_TYPE = 5;
  PAM_BINARY_PROMPT = 7;
  PAM_MAX_NUM_MSG = 32;
  PAM_MAX_MSG_SIZE = 512;
  PAM_MAX_RESP_SIZE = 512;

type
  Tpam_message = record
    msg_style: longint;
    msg: pchar;
  end;
  Ppam_message = ^Tpam_message;
  PPpam_message = ^Ppam_message;

  Tpam_response = record
    resp: pchar;
    resp_retcode: longint;
  end;
  Ppam_response = ^Tpam_response;
  PPpam_response = ^Ppam_response;

  Tpam_conv = record
    conv: function(num_msg: longint; msg: PPpam_message; resp: PPpam_response; appdata_ptr: pointer): longint; cdecl;
    appdata_ptr: pointer;
  end;
  Ppam_conv = ^Tpam_conv;

  Tpam_xauth_data = record
    namelen: longint;
    name: pchar;
    datalen: longint;
    data: pchar;
  end;
  Ppam_xauth_data = ^Tpam_xauth_data;


  // === Konventiert am: 13-7-25 15:32:09 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function PAM_GNUC_PREREQ(maj, min: longint): longint;
begin
  PAM_GNUC_PREREQ := 0;
end;


{$ENDIF read_implementation}
