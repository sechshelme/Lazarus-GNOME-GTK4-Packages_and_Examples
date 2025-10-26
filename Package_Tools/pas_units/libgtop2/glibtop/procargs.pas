unit procargs;

interface

uses
  fp_glib2, fp_libgtop2, glibtop;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  GLIBTOP_PROC_ARGS_SIZE = 0;
  GLIBTOP_MAX_PROC_ARGS = 1;

type
  Tglibtop_proc_args = record
    flags: Tguint64;
    size: Tguint64;
  end;
  Pglibtop_proc_args = ^Tglibtop_proc_args;

function glibtop_get_proc_args_l(server: Pglibtop; buf: Pglibtop_proc_args; pid: Tpid_t; max_len: dword): pchar; cdecl; external libgtop2;
function glibtop_get_proc_args(buf: Pglibtop_proc_args; pid: Tpid_t; max_len: dword): pchar; cdecl; external libgtop2;

function glibtop_get_proc_args_r(server: Pglibtop; buf: Pglibtop_proc_args; pid: Tpid_t; max_len: dword): pchar; cdecl; external libgtop2 name 'glibtop_get_proc_args_s';

procedure _glibtop_init_proc_args_s(server: Pglibtop); cdecl; external libgtop2;
function glibtop_get_proc_args_s(server: Pglibtop; buf: Pglibtop_proc_args; pid: Tpid_t; max_len: dword): pchar; cdecl; external libgtop2;

function glibtop_get_proc_argv_l(server: Pglibtop; buf: Pglibtop_proc_args; pid: Tpid_t; max_len: dword): Ppchar; cdecl; external libgtop2;
function glibtop_get_proc_argv(buf: Pglibtop_proc_args; pid: Tpid_t; max_len: dword): Ppchar; cdecl; external libgtop2;

// === Konventiert am: 26-10-25 12:04:43 ===


implementation



end.
