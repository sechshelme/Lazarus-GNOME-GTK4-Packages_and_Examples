{$IFDEF read_interface}


function sd_pid_get_session(pid: Tpid_t; session: PPchar): longint; cdecl; external libsystemd;
function sd_pid_get_owner_uid(pid: Tpid_t; uid: Puid_t): longint; cdecl; external libsystemd;
function sd_pid_get_unit(pid: Tpid_t; unit_: PPchar): longint; cdecl; external libsystemd;
function sd_pid_get_user_unit(pid: Tpid_t; unit_: PPchar): longint; cdecl; external libsystemd;
function sd_pid_get_slice(pid: Tpid_t; slice: PPchar): longint; cdecl; external libsystemd;
function sd_pid_get_user_slice(pid: Tpid_t; slice: PPchar): longint; cdecl; external libsystemd;
function sd_pid_get_machine_name(pid: Tpid_t; machine: PPchar): longint; cdecl; external libsystemd;
function sd_pid_get_cgroup(pid: Tpid_t; cgroup: PPchar): longint; cdecl; external libsystemd;
function sd_pidfd_get_session(pidfd: longint; session: PPchar): longint; cdecl; external libsystemd;
function sd_pidfd_get_owner_uid(pidfd: longint; uid: Puid_t): longint; cdecl; external libsystemd;
function sd_pidfd_get_unit(pidfd: longint; unit_: PPchar): longint; cdecl; external libsystemd;
function sd_pidfd_get_user_unit(pidfd: longint; unit_: PPchar): longint; cdecl; external libsystemd;
function sd_pidfd_get_slice(pidfd: longint; slice: PPchar): longint; cdecl; external libsystemd;
function sd_pidfd_get_user_slice(pidfd: longint; slice: PPchar): longint; cdecl; external libsystemd;
function sd_pidfd_get_machine_name(pidfd: longint; machine: PPchar): longint; cdecl; external libsystemd;
function sd_pidfd_get_cgroup(pidfd: longint; cgroup: PPchar): longint; cdecl; external libsystemd;
function sd_peer_get_session(fd: longint; session: PPchar): longint; cdecl; external libsystemd;
function sd_peer_get_owner_uid(fd: longint; uid: Puid_t): longint; cdecl; external libsystemd;
function sd_peer_get_unit(fd: longint; unit_: PPchar): longint; cdecl; external libsystemd;
function sd_peer_get_user_unit(fd: longint; unit_: PPchar): longint; cdecl; external libsystemd;
function sd_peer_get_slice(fd: longint; slice: PPchar): longint; cdecl; external libsystemd;
function sd_peer_get_user_slice(fd: longint; slice: PPchar): longint; cdecl; external libsystemd;
function sd_peer_get_machine_name(fd: longint; machine: PPchar): longint; cdecl; external libsystemd;
function sd_peer_get_cgroup(fd: longint; cgroup: PPchar): longint; cdecl; external libsystemd;
function sd_uid_get_state(uid: Tuid_t; state: PPchar): longint; cdecl; external libsystemd;
function sd_uid_get_display(uid: Tuid_t; session: PPchar): longint; cdecl; external libsystemd;
function sd_uid_get_login_time(uid: Tuid_t; usec: Puint64): longint; cdecl; external libsystemd;
function sd_uid_is_on_seat(uid: Tuid_t; require_active: longint; seat: pchar): longint; cdecl; external libsystemd;
function sd_uid_get_sessions(uid: Tuid_t; require_active: longint; sessions: PPPchar): longint; cdecl; external libsystemd;
function sd_uid_get_seats(uid: Tuid_t; require_active: longint; seats: PPPchar): longint; cdecl; external libsystemd;
function sd_session_is_active(session: pchar): longint; cdecl; external libsystemd;
function sd_session_is_remote(session: pchar): longint; cdecl; external libsystemd;
function sd_session_get_state(session: pchar; state: PPchar): longint; cdecl; external libsystemd;
function sd_session_get_uid(session: pchar; uid: Puid_t): longint; cdecl; external libsystemd;
function sd_session_get_username(session: pchar; username: PPchar): longint; cdecl; external libsystemd;
function sd_session_get_seat(session: pchar; seat: PPchar): longint; cdecl; external libsystemd;
function sd_session_get_start_time(session: pchar; usec: Puint64): longint; cdecl; external libsystemd;
function sd_session_get_service(session: pchar; service: PPchar): longint; cdecl; external libsystemd;
function sd_session_get_type(session: pchar; _type: PPchar): longint; cdecl; external libsystemd;
function sd_session_get_class(session: pchar; clazz: PPchar): longint; cdecl; external libsystemd;
function sd_session_get_desktop(session: pchar; desktop: PPchar): longint; cdecl; external libsystemd;
function sd_session_get_display(session: pchar; display: PPchar): longint; cdecl; external libsystemd;
function sd_session_get_leader(session: pchar; leader: Ppid_t): longint; cdecl; external libsystemd;
function sd_session_get_remote_host(session: pchar; remote_host: PPchar): longint; cdecl; external libsystemd;
function sd_session_get_remote_user(session: pchar; remote_user: PPchar): longint; cdecl; external libsystemd;
function sd_session_get_tty(session: pchar; display: PPchar): longint; cdecl; external libsystemd;
function sd_session_get_vt(session: pchar; vtnr: Pdword): longint; cdecl; external libsystemd;
function sd_seat_get_active(seat: pchar; session: PPchar; uid: Puid_t): longint; cdecl; external libsystemd;
function sd_seat_get_sessions(seat: pchar; ret_sessions: PPPchar; ret_uids: PPuid_t; ret_n_uids: Pdword): longint; cdecl; external libsystemd;
function sd_seat_can_multi_session(seat: pchar): longint; cdecl; external libsystemd; deprecated;
function sd_seat_can_tty(seat: pchar): longint; cdecl; external libsystemd;
function sd_seat_can_graphical(seat: pchar): longint; cdecl; external libsystemd;
function sd_machine_get_class(machine: pchar; clazz: PPchar): longint; cdecl; external libsystemd;
function sd_machine_get_ifindices(machine: pchar; ret_ifindices: PPlongint): longint; cdecl; external libsystemd;
function sd_get_seats(seats: PPPchar): longint; cdecl; external libsystemd;
function sd_get_sessions(sessions: PPPchar): longint; cdecl; external libsystemd;
function sd_get_uids(users: PPuid_t): longint; cdecl; external libsystemd;
function sd_get_machine_names(machines: PPPchar): longint; cdecl; external libsystemd;

type
  Psd_login_monitor = type Pointer;
  PPsd_login_monitor = ^Psd_login_monitor;

function sd_login_monitor_new(category: pchar; ret: PPsd_login_monitor): longint; cdecl; external libsystemd;
function sd_login_monitor_unref(m: Psd_login_monitor): Psd_login_monitor; cdecl; external libsystemd;
function sd_login_monitor_flush(m: Psd_login_monitor): longint; cdecl; external libsystemd;
function sd_login_monitor_get_fd(m: Psd_login_monitor): longint; cdecl; external libsystemd;
function sd_login_monitor_get_events(m: Psd_login_monitor): longint; cdecl; external libsystemd;
function sd_login_monitor_get_timeout(m: Psd_login_monitor; timeout_usec: Puint64): longint; cdecl; external libsystemd;

// === Konventiert am: 16-7-25 19:04:12 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
