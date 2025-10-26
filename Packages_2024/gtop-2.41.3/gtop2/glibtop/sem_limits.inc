{$IFDEF read_interface}


const
  GLIBTOP_IPC_SEMMAP = 0;
  GLIBTOP_IPC_SEMMNI = 1;
  GLIBTOP_IPC_SEMMNS = 2;
  GLIBTOP_IPC_SEMMNU = 3;
  GLIBTOP_IPC_SEMMSL = 4;
  GLIBTOP_IPC_SEMOPM = 5;
  GLIBTOP_IPC_SEMUME = 6;
  GLIBTOP_IPC_SEMUSZ = 7;
  GLIBTOP_IPC_SEMVMX = 8;
  GLIBTOP_IPC_SEMAEM = 9;
  GLIBTOP_MAX_SEM_LIMITS = 10;

type
  Tglibtop_sem_limits = record
    flags: Tguint64;
    semmap: Tguint64;
    semmni: Tguint64;
    semmns: Tguint64;
    semmnu: Tguint64;
    semmsl: Tguint64;
    semopm: Tguint64;
    semume: Tguint64;
    semusz: Tguint64;
    semvmx: Tguint64;
    semaem: Tguint64;
  end;
  Pglibtop_sem_limits = ^Tglibtop_sem_limits;

procedure glibtop_get_sem_limits(buf: Pglibtop_sem_limits); cdecl; external libgtop2;

procedure glibtop_get_sem_limits_r(server: Pglibtop; buf: Pglibtop_sem_limits); cdecl; external libgtop2 name 'glibtop_get_sem_limits_s';

procedure glibtop_get_sem_limits_l(server: Pglibtop; buf: Pglibtop_sem_limits); cdecl; external libgtop2;

procedure _glibtop_init_sem_limits_s(server: Pglibtop); cdecl; external libgtop2;
procedure glibtop_get_sem_limits_s(server: Pglibtop; buf: Pglibtop_sem_limits); cdecl; external libgtop2;

// === Konventiert am: 26-10-25 12:04:06 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
