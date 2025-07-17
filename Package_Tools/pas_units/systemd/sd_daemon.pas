unit sd_daemon;

interface

uses
  clib, fp_systemd;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  SD_EMERG = '<0>';
  SD_ALERT = '<1>';
  SD_CRIT = '<2>';
  SD_ERR = '<3>';
  SD_WARNING = '<4>';
  SD_NOTICE = '<5>';
  SD_INFO = '<6>';
  SD_DEBUG = '<7>';
  SD_LISTEN_FDS_START = 3;

function sd_listen_fds(unset_environment: longint): longint; cdecl; external libsystemd;
function sd_listen_fds_with_names(unset_environment: longint; names: PPPchar): longint; cdecl; external libsystemd;
function sd_is_fifo(fd: longint; path: pchar): longint; cdecl; external libsystemd;
function sd_is_special(fd: longint; path: pchar): longint; cdecl; external libsystemd;
function sd_is_socket(fd: longint; family: longint; _type: longint; listening: longint): longint; cdecl; external libsystemd;
function sd_is_socket_inet(fd: longint; family: longint; _type: longint; listening: longint; port: uint16): longint; cdecl; external libsystemd;
function sd_is_socket_sockaddr(fd: longint; _type: longint; addr: Psockaddr; addr_len: dword; listening: longint): longint; cdecl; external libsystemd;
function sd_is_socket_unix(fd: longint; _type: longint; listening: longint; path: pchar; length: Tsize_t): longint; cdecl; external libsystemd;
function sd_is_mq(fd: longint; path: pchar): longint; cdecl; external libsystemd;
function sd_notify(unset_environment: longint; state: pchar): longint; cdecl; external libsystemd;
function sd_notifyf(unset_environment: longint; format: pchar; args: array of const): longint; cdecl; external libsystemd;
function sd_notifyf(unset_environment: longint; format: pchar): longint; cdecl; external libsystemd;
function sd_pid_notify(pid: Tpid_t; unset_environment: longint; state: pchar): longint; cdecl; external libsystemd;
function sd_pid_notifyf(pid: Tpid_t; unset_environment: longint; format: pchar; args: array of const): longint; cdecl; external libsystemd;
function sd_pid_notifyf(pid: Tpid_t; unset_environment: longint; format: pchar): longint; cdecl; external libsystemd;
function sd_pid_notify_with_fds(pid: Tpid_t; unset_environment: longint; state: pchar; fds: Plongint; n_fds: dword): longint; cdecl; external libsystemd;
function sd_pid_notifyf_with_fds(pid: Tpid_t; unset_environment: longint; fds: Plongint; n_fds: Tsize_t; format: pchar): longint; cdecl; varargs; external libsystemd;
function sd_notify_barrier(unset_environment: longint; timeout: uint64): longint; cdecl; external libsystemd;
function sd_pid_notify_barrier(pid: Tpid_t; unset_environment: longint; timeout: uint64): longint; cdecl; external libsystemd;
function sd_booted: longint; cdecl; external libsystemd;
function sd_watchdog_enabled(unset_environment: longint; usec: Puint64): longint; cdecl; external libsystemd;

// === Konventiert am: 16-7-25 19:03:53 ===


implementation



end.
