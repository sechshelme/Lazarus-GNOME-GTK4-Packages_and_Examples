unit shm_limits;

interface

uses
  fp_glib2, fp_libgtop2, glibtop;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  GLIBTOP_IPC_SHMMAX = 0;
  GLIBTOP_IPC_SHMMIN = 1;
  GLIBTOP_IPC_SHMMNI = 2;
  GLIBTOP_IPC_SHMSEG = 3;
  GLIBTOP_IPC_SHMALL = 4;
  GLIBTOP_MAX_SHM_LIMITS = 5;

type
  Tglibtop_shm_limits = record
    flags: Tguint64;
    shmmax: Tguint64;
    shmmin: Tguint64;
    shmmni: Tguint64;
    shmseg: Tguint64;
    shmall: Tguint64;
  end;
  Pglibtop_shm_limits = ^Tglibtop_shm_limits;

procedure glibtop_get_shm_limits(buf: Pglibtop_shm_limits); cdecl; external libgtop2;

procedure glibtop_get_shm_limits_r(server: Pglibtop; buf: Pglibtop_shm_limits); cdecl; external libgtop2 name 'glibtop_get_shm_limits_s';

procedure glibtop_get_shm_limits_l(server: Pglibtop; buf: Pglibtop_shm_limits); cdecl; external libgtop2;

procedure _glibtop_init_shm_limits_s(server: Pglibtop); cdecl; external libgtop2;
procedure glibtop_get_shm_limits_s(server: Pglibtop; buf: Pglibtop_shm_limits); cdecl; external libgtop2;

// === Konventiert am: 26-10-25 12:04:03 ===


implementation



end.
