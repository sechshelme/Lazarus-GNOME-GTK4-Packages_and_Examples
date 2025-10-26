unit mountlist;

interface

uses
  fp_glib2, fp_libgtop2, glibtop;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  GLIBTOP_MOUNTLIST_NUMBER = 0;
  GLIBTOP_MOUNTLIST_TOTAL = 1;
  GLIBTOP_MOUNTLIST_SIZE = 2;
  GLIBTOP_MAX_MOUNTLIST = 3;

type
  Tglibtop_mountentry = record
    dev: Tguint64;
    devname: array[0..(GLIBTOP_MOUNTENTRY_LEN + 1) - 1] of char;
    mountdir: array[0..(GLIBTOP_MOUNTENTRY_LEN + 1) - 1] of char;
    _type: array[0..(GLIBTOP_MOUNTENTRY_LEN + 1) - 1] of char;
  end;
  Pglibtop_mountentry = ^Tglibtop_mountentry;

  Tglibtop_mountlist = record
    flags: Tguint64;
    number: Tguint64;
    total: Tguint64;
    size: Tguint64;
  end;
  Pglibtop_mountlist = ^Tglibtop_mountlist;

function glibtop_get_mountlist(buf: Pglibtop_mountlist; all_fs: longint): Pglibtop_mountentry; cdecl; external libgtop2;

function glibtop_get_mountlist_r(server: Pglibtop; buf: Pglibtop_mountlist; all_fs: longint): Pglibtop_mountentry; cdecl; external libgtop2 name 'glibtop_get_mountlist_s';

function glibtop_get_mountlist_l(server: Pglibtop; buf: Pglibtop_mountlist; all_fs: longint): Pglibtop_mountentry; cdecl; external libgtop2;
function glibtop_get_mountlist_s(server: Pglibtop; buf: Pglibtop_mountlist; all_fs: longint): Pglibtop_mountentry; cdecl; external libgtop2;
function glibtop_mountlist_get_type: TGType; cdecl; external libgtop2;
function glibtop_mountentry_get_type: TGType; cdecl; external libgtop2;

// === Konventiert am: 26-10-25 12:05:13 ===


implementation



end.
