unit pam_modutil;

interface

uses
  fp_pam, _pam_types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function pam_modutil_check_user_in_passwd(pamh: Ppam_handle_t; user_name: pchar; file_name: pchar): longint; cdecl; external libpam;
function pam_modutil_getpwnam(pamh: Ppam_handle_t; user: pchar): Ppasswd; cdecl; external libpam;
function pam_modutil_getpwuid(pamh: Ppam_handle_t; uid: Tuid_t): Ppasswd; cdecl; external libpam;
function pam_modutil_getgrnam(pamh: Ppam_handle_t; group: pchar): Pgroup; cdecl; external libpam;
function pam_modutil_getgrgid(pamh: Ppam_handle_t; gid: Tgid_t): Pgroup; cdecl; external libpam;
function pam_modutil_getspnam(pamh: Ppam_handle_t; user: pchar): Pspwd; cdecl; external libpam;
function pam_modutil_user_in_group_nam_nam(pamh: Ppam_handle_t; user: pchar; group: pchar): longint; cdecl; external libpam;
function pam_modutil_user_in_group_nam_gid(pamh: Ppam_handle_t; user: pchar; group: Tgid_t): longint; cdecl; external libpam;
function pam_modutil_user_in_group_uid_nam(pamh: Ppam_handle_t; user: Tuid_t; group: pchar): longint; cdecl; external libpam;
function pam_modutil_user_in_group_uid_gid(pamh: Ppam_handle_t; user: Tuid_t; group: Tgid_t): longint; cdecl; external libpam;
function pam_modutil_getlogin(pamh: Ppam_handle_t): pchar; cdecl; external libpam;
function pam_modutil_read(fd: longint; buffer: pchar; count: longint): longint; cdecl; external libpam;
function pam_modutil_write(fd: longint; buffer: pchar; count: longint): longint; cdecl; external libpam;
function pam_modutil_audit_write(pamh: Ppam_handle_t; _type: longint; message: pchar; retval: longint): longint; cdecl; external libpam;

type
  Tpam_modutil_privs = record
    grplist: Pgid_t;
    number_of_groups: longint;
    allocated: longint;
    old_gid: Tgid_t;
    old_uid: Tuid_t;
    is_dropped: longint;
  end;
  Ppam_modutil_privs = ^Tpam_modutil_privs;

const
  PAM_MODUTIL_NGROUPS = 64;

function pam_modutil_drop_priv(pamh: Ppam_handle_t; p: Ppam_modutil_privs; pw: Ppasswd): longint; cdecl; external libpam;
function pam_modutil_regain_priv(pamh: Ppam_handle_t; p: Ppam_modutil_privs): longint; cdecl; external libpam;

type
  Tpam_modutil_redirect_fd = longint;

const
  PAM_MODUTIL_IGNORE_FD = 0;
  PAM_MODUTIL_PIPE_FD = 1;
  PAM_MODUTIL_NULL_FD = 2;

function pam_modutil_sanitize_helper_fds(pamh: Ppam_handle_t; redirect_stdin: Tpam_modutil_redirect_fd; redirect_stdout: Tpam_modutil_redirect_fd; redirect_stderr: Tpam_modutil_redirect_fd): longint; cdecl; external libpam;
function pam_modutil_search_key(pamh: Ppam_handle_t; file_name: pchar; key: pchar): pchar; cdecl; external libpam;

// === Konventiert am: 13-7-25 15:32:06 ===


implementation



end.
