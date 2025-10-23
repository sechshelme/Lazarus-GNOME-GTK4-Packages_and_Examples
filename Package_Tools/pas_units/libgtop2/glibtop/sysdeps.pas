unit sysdeps;

interface

uses
  fp_glib2, fp_libgtop2;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

const
  GLIBTOP_SYSDEPS_FEATURES = 0;
  GLIBTOP_SYSDEPS_CPU = 1;
  GLIBTOP_SYSDEPS_MEM = 2;
  GLIBTOP_SYSDEPS_SWAP = 3;
  GLIBTOP_SYSDEPS_UPTIME = 4;
  GLIBTOP_SYSDEPS_LOADAVG = 5;
  GLIBTOP_SYSDEPS_SHM_LIMITS = 6;
  GLIBTOP_SYSDEPS_MSG_LIMITS = 7;
  GLIBTOP_SYSDEPS_SEM_LIMITS = 8;
  GLIBTOP_SYSDEPS_PROCLIST = 9;
  GLIBTOP_SYSDEPS_PROC_STATE = 10;
  GLIBTOP_SYSDEPS_PROC_UID = 11;
  GLIBTOP_SYSDEPS_PROC_MEM = 12;
  GLIBTOP_SYSDEPS_PROC_TIME = 13;
  GLIBTOP_SYSDEPS_PROC_SIGNAL = 14;
  GLIBTOP_SYSDEPS_PROC_KERNEL = 15;
  GLIBTOP_SYSDEPS_PROC_SEGMENT = 16;
  GLIBTOP_SYSDEPS_PROC_ARGS = 17;
  GLIBTOP_SYSDEPS_PROC_MAP = 18;
  GLIBTOP_SYSDEPS_MOUNTLIST = 19;
  GLIBTOP_SYSDEPS_FSUSAGE = 20;
  GLIBTOP_SYSDEPS_NETLOAD = 21;
  GLIBTOP_SYSDEPS_PPP = 22;
  GLIBTOP_SYSDEPS_NETLIST = 23;
  GLIBTOP_SYSDEPS_PROC_OPEN_FILES = 24;
  GLIBTOP_SYSDEPS_PROC_WD = 25;
  GLIBTOP_SYSDEPS_PROC_AFFINITY = 26;
  GLIBTOP_SYSDEPS_PROC_IO = 27;
  GLIBTOP_SYSDEPS_DISK = 28;
  GLIBTOP_MAX_SYSDEPS = 29;

  GLIBTOP_SYSDEPS_ALL = (1 shl GLIBTOP_MAX_SYSDEPS) - 1;

type
  Tglibtop_sysdeps = record
    flags: Tguint64;
    features: Tguint64;
    cpu: Tguint64;
    mem: Tguint64;
    swap: Tguint64;
    uptime: Tguint64;
    loadavg: Tguint64;
    shm_limits: Tguint64;
    msg_limits: Tguint64;
    sem_limits: Tguint64;
    proclist: Tguint64;
    proc_state: Tguint64;
    proc_uid: Tguint64;
    proc_mem: Tguint64;
    proc_time: Tguint64;
    proc_signal: Tguint64;
    proc_kernel: Tguint64;
    proc_segment: Tguint64;
    proc_args: Tguint64;
    proc_map: Tguint64;
    proc_open_files: Tguint64;
    mountlist: Tguint64;
    fsusage: Tguint64;
    netlist: Tguint64;
    netload: Tguint64;
    ppp: Tguint64;
    proc_wd: Tguint64;
    proc_affinity: Tguint64;
    proc_io: Tguint64;
    disk: Tguint64;
    reserved1: Tguint64;
    reserved2: Tguint64;
    reserved3: Tguint64;
    reserved4: Tguint64;
    reserved5: Tguint64;
    reserved6: Tguint64;
    reserved7: Tguint64;
  end;
  Pglibtop_sysdeps = ^Tglibtop_sysdeps;

procedure glibtop_get_sysdeps(buf: Pglibtop_sysdeps); cdecl; external libgtop2;
procedure glibtop_get_sysdeps_r(server: Pglibtop; buf: Pglibtop_sysdeps); cdecl; external libgtop2;

// === Konventiert am: 23-10-25 19:49:58 ===


implementation



end.
