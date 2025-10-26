unit procio;

interface

uses
  fp_glib2, fp_libgtop2, glibtop;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  GLIBTOP_PROC_IO_DISK_RCHAR = 0;
  GLIBTOP_PROC_IO_DISK_WCHAR = 1;
  GLIBTOP_PROC_IO_DISK_RBYTES = 2;
  GLIBTOP_PROC_IO_DISK_WBYTES = 3;
  GLIBTOP_MAX_PROC_IO = 3;

type
  Tglibtop_proc_io = record
    flags: Tguint64;
    disk_rchar: Tguint64;
    disk_wchar: Tguint64;
    disk_rbytes: Tguint64;
    disk_wbytes: Tguint64;
    reserved: array[0..9] of Tguint64;
  end;
  Pglibtop_proc_io = ^Tglibtop_proc_io;

procedure glibtop_get_proc_io(buf: Pglibtop_proc_io; pid: Tpid_t); cdecl; external libgtop2;

procedure glibtop_get_proc_io_r(server: Pglibtop; buf: Pglibtop_proc_io; pid: Tpid_t); cdecl; external libgtop2 name 'glibtop_get_proc_io_s';

procedure glibtop_get_proc_io_l(server: Pglibtop; buf: Pglibtop_proc_io; pid: Tpid_t); cdecl; external libgtop2;

procedure _glibtop_init_proc_io_s(server: Pglibtop); cdecl; external libgtop2;
procedure glibtop_get_proc_io_s(server: Pglibtop; buf: Pglibtop_proc_io; pid: Tpid_t); cdecl; external libgtop2;

// === Konventiert am: 26-10-25 12:04:40 ===


implementation



end.
