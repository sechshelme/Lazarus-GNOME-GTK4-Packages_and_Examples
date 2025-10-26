{$IFDEF read_interface}


function LIBGTOP_CHECK_VERSION(major, minor, micro: integer): boolean;

const
  GLIBTOP_MOUNTENTRY_LEN = 79;

type
  Tglibtop = record
    flags: dword;
    method: dword;
    error_method: dword;
    input: array[0..1] of longint;
    output: array[0..1] of longint;
    socket: longint;
    ncpu: longint;
    real_ncpu: longint;
    os_version_code: dword;
    name: pchar;
    server_command: pchar;
    server_host: pchar;
    server_user: pchar;
    server_rsh: pchar;
    features: dword;
    server_port: dword;
    sysdeps: Tglibtop_sysdeps;
    required: Tglibtop_sysdeps;
    pid: Tpid_t;
    uid: Tuid_t;
    euid: Tuid_t;
    gid: Tgid_t;
    egid: Tgid_t;
    machine: Pglibtop_machine;
    ndisk: longint;
    real_ndisk: longint;
  end;
  Pglibtop = ^Tglibtop;
  PPglibtop = ^Pglibtop;

var
  glibtop_global_server: Pglibtop; cvar;external libgtop2;
  glibtop_server_features: dword; cvar;external libgtop2;

function glibtop_init: Pglibtop; cdecl; external libgtop2;
function glibtop_init_r(server_ptr: PPglibtop; features: dword; flags: dword): Pglibtop; cdecl; external libgtop2;
function glibtop_init_s(server_ptr: PPglibtop; features: dword; flags: dword): Pglibtop; cdecl; external libgtop2;
function glibtop_get_type: TGType; cdecl; external libgtop2;

// === Konventiert am: 23-10-25 19:35:42 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function LIBGTOP_CHECK_VERSION(major, minor, micro: integer): boolean;
begin
  Result :=
    (LIBGTOP_MAJOR_VERSION > major) or
    ((LIBGTOP_MAJOR_VERSION = major) and (LIBGTOP_MINOR_VERSION > minor)) or
    ((LIBGTOP_MAJOR_VERSION = major) and (LIBGTOP_MINOR_VERSION = minor) and
    (LIBGTOP_MICRO_VERSION >= micro));
end;


{$ENDIF read_implementation}
