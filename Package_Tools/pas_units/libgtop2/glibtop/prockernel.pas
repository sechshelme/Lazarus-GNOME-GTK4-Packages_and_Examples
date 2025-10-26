unit prockernel;

interface

uses
  fp_glib2, fp_libgtop2, glibtop;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  GLIBTOP_PROC_KERNEL_K_FLAGS = 0;
  GLIBTOP_PROC_KERNEL_MIN_FLT = 1;
  GLIBTOP_PROC_KERNEL_MAJ_FLT = 2;
  GLIBTOP_PROC_KERNEL_CMIN_FLT = 3;
  GLIBTOP_PROC_KERNEL_CMAJ_FLT = 4;
  GLIBTOP_PROC_KERNEL_KSTK_ESP = 5;
  GLIBTOP_PROC_KERNEL_KSTK_EIP = 6;
  GLIBTOP_PROC_KERNEL_NWCHAN = 7;
  GLIBTOP_PROC_KERNEL_WCHAN = 8;
  GLIBTOP_MAX_PROC_KERNEL = 9;

type
  Tglibtop_proc_kernel = record
    flags: Tguint64;
    k_flags: Tguint64;
    min_flt: Tguint64;
    maj_flt: Tguint64;
    cmin_flt: Tguint64;
    cmaj_flt: Tguint64;
    kstk_esp: Tguint64;
    kstk_eip: Tguint64;
    nwchan: Tguint64;
    wchan: array[0..39] of char;
  end;
  Pglibtop_proc_kernel = ^Tglibtop_proc_kernel;

procedure glibtop_get_proc_kernel(buf: Pglibtop_proc_kernel; pid: Tpid_t); cdecl; external libgtop2;

procedure glibtop_get_proc_kernel_r(server: Pglibtop; buf: Pglibtop_proc_kernel; pid: Tpid_t); cdecl; external libgtop2 name 'glibtop_get_proc_kernel_s';

procedure glibtop_get_proc_kernel_l(server: Pglibtop; buf: Pglibtop_proc_kernel; pid: Tpid_t); cdecl; external libgtop2;

procedure _glibtop_init_proc_kernel_s(server: Pglibtop); cdecl; external libgtop2;
procedure glibtop_get_proc_kernel_s(server: Pglibtop; buf: Pglibtop_proc_kernel; pid: Tpid_t); cdecl; external libgtop2;

// === Konventiert am: 26-10-25 12:04:37 ===


implementation



end.
