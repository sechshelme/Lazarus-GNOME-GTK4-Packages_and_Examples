{$IFDEF read_interface}


const
  GLIBTOP_CPU_TOTAL = 0;
  GLIBTOP_CPU_USER = 1;
  GLIBTOP_CPU_NICE = 2;
  GLIBTOP_CPU_SYS = 3;
  GLIBTOP_CPU_IDLE = 4;
  GLIBTOP_CPU_FREQUENCY = 5;
  GLIBTOP_XCPU_TOTAL = 6;
  GLIBTOP_XCPU_USER = 7;
  GLIBTOP_XCPU_NICE = 8;
  GLIBTOP_XCPU_SYS = 9;
  GLIBTOP_XCPU_IDLE = 10;
  GLIBTOP_XCPU_FLAGS = 11;
  GLIBTOP_CPU_IOWAIT = 12;
  GLIBTOP_CPU_IRQ = 13;
  GLIBTOP_CPU_SOFTIRQ = 14;
  GLIBTOP_XCPU_IOWAIT = 15;
  GLIBTOP_XCPU_IRQ = 16;
  GLIBTOP_XCPU_SOFTIRQ = 17;
  GLIBTOP_MAX_CPU = 18;

  GLIBTOP_NCPU = 1024;

type
  Tglibtop_cpu = record
    flags: Tguint64;
    total: Tguint64;
    user: Tguint64;
    nice: Tguint64;
    sys: Tguint64;
    idle: Tguint64;
    iowait: Tguint64;
    irq: Tguint64;
    softirq: Tguint64;
    frequency: Tguint64;
    xcpu_total: array[0..(GLIBTOP_NCPU) - 1] of Tguint64;
    xcpu_user: array[0..(GLIBTOP_NCPU) - 1] of Tguint64;
    xcpu_nice: array[0..(GLIBTOP_NCPU) - 1] of Tguint64;
    xcpu_sys: array[0..(GLIBTOP_NCPU) - 1] of Tguint64;
    xcpu_idle: array[0..(GLIBTOP_NCPU) - 1] of Tguint64;
    xcpu_iowait: array[0..(GLIBTOP_NCPU) - 1] of Tguint64;
    xcpu_irq: array[0..(GLIBTOP_NCPU) - 1] of Tguint64;
    xcpu_softirq: array[0..(GLIBTOP_NCPU) - 1] of Tguint64;
    xcpu_flags: Tguint64;
  end;
  Pglibtop_cpu = ^Tglibtop_cpu;


procedure glibtop_get_cpu(buf: Pglibtop_cpu); cdecl; external libgtop2;

procedure glibtop_get_cpu_r(server: Pglibtop; buf: Pglibtop_cpu); cdecl; external libgtop2 name 'glibtop_get_cpu_s';

procedure glibtop_get_cpu_l(server: Pglibtop; buf: Pglibtop_cpu); cdecl; external libgtop2;

procedure _glibtop_init_cpu_s(server: Pglibtop); cdecl; external libgtop2;
procedure glibtop_get_cpu_s(server: Pglibtop; buf: Pglibtop_cpu); cdecl; external libgtop2;

// === Konventiert am: 26-10-25 12:05:35 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
