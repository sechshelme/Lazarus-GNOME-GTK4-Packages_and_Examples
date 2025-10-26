unit procaffinity;

interface

uses
  fp_glib2, fp_libgtop2, glibtop;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  GLIBTOP_PROC_AFFINITY_NUMBER = 0;
  GLIBTOP_PROC_AFFINITY_ALL = 1;
  GLIBTOP_MAX_PROC_AFFINITY = 2;

type
  Tglibtop_proc_affinity = record
    flags: Tguint64;
    number: Tguint32;
    all: Tgboolean;
  end;
  Pglibtop_proc_affinity = ^Tglibtop_proc_affinity;

function glibtop_get_proc_affinity(buf: Pglibtop_proc_affinity; pid: Tpid_t): Pguint16; cdecl; external libgtop2;
function glibtop_get_proc_affinity_l(server: Pglibtop; buf: Pglibtop_proc_affinity; pid: Tpid_t): Pguint16; cdecl; external libgtop2;

function glibtop_get_proc_affinity_r(server: Pglibtop; buf: Pglibtop_proc_affinity; pid: Tpid_t): Pguint16; cdecl; external libgtop2 name 'glibtop_get_proc_affinity_s';

procedure _glibtop_init_proc_affinity_s(server: Pglibtop); cdecl; external libgtop2;
function glibtop_get_proc_affinity_s(server: Pglibtop; buf: Pglibtop_proc_affinity; pid: Tpid_t): Pguint16; cdecl; external libgtop2;

// === Konventiert am: 26-10-25 12:04:45 ===


implementation



end.
