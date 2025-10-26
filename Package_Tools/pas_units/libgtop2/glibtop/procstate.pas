unit procstate;

interface

uses
  fp_glib2, fp_libgtop2, glibtop;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  GLIBTOP_PROC_STATE_CMD = 0;
  GLIBTOP_PROC_STATE_STATE = 1;
  GLIBTOP_PROC_STATE_UID = 2;
  GLIBTOP_PROC_STATE_GID = 3;
  GLIBTOP_PROC_STATE_RUID = 4;
  GLIBTOP_PROC_STATE_RGID = 5;
  GLIBTOP_PROC_STATE_HAS_CPU = 6;
  GLIBTOP_PROC_STATE_PROCESSOR = 7;
  GLIBTOP_PROC_STATE_LAST_PROCESSOR = 8;
  GLIBTOP_MAX_PROC_STATE = 9;
  GLIBTOP_PROCESS_RUNNING = 1;
  GLIBTOP_PROCESS_INTERRUPTIBLE = 2;
  GLIBTOP_PROCESS_UNINTERRUPTIBLE = 4;
  GLIBTOP_PROCESS_ZOMBIE = 8;
  GLIBTOP_PROCESS_STOPPED = 16;
  GLIBTOP_PROCESS_SWAPPING = 32;
  GLIBTOP_PROCESS_DEAD = 64;

type
  Tglibtop_proc_state = record
    flags: Tguint64;
    cmd: array[0..39] of char;
    state: dword;
    uid: longint;
    gid: longint;
    ruid: longint;
    rgid: longint;
    has_cpu: longint;
    processor: longint;
    last_processor: longint;
  end;
  Pglibtop_proc_state = ^Tglibtop_proc_state;

procedure glibtop_get_proc_state(buf: Pglibtop_proc_state; pid: Tpid_t); cdecl; external libgtop2;

procedure glibtop_get_proc_state_r(server: Pglibtop; buf: Pglibtop_proc_state; pid: Tpid_t); cdecl; external libgtop2 name 'glibtop_get_proc_state_s';

procedure glibtop_get_proc_state_l(server: Pglibtop; buf: Pglibtop_proc_state; pid: Tpid_t); cdecl; external libgtop2;

procedure _glibtop_init_proc_state_s(server: Pglibtop); cdecl; external libgtop2;
procedure glibtop_get_proc_state_s(server: Pglibtop; buf: Pglibtop_proc_state; pid: Tpid_t); cdecl; external libgtop2;

// === Konventiert am: 26-10-25 12:04:16 ===


implementation



end.
