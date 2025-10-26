unit procmap;

interface

uses
  fp_glib2, fp_libgtop2, glibtop;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  GLIBTOP_PROC_MAP_NUMBER = 0;
  GLIBTOP_PROC_MAP_TOTAL = 1;
  GLIBTOP_PROC_MAP_SIZE = 2;
  GLIBTOP_MAX_PROC_MAP = 3;
  GLIBTOP_MAP_ENTRY_START = 0;
  GLIBTOP_MAP_ENTRY_END = 1;
  GLIBTOP_MAP_ENTRY_OFFSET = 2;
  GLIBTOP_MAP_ENTRY_PERM = 3;
  GLIBTOP_MAP_ENTRY_INODE = 4;
  GLIBTOP_MAP_ENTRY_DEVICE = 5;
  GLIBTOP_MAP_ENTRY_FILENAME = 6;
  GLIBTOP_MAP_ENTRY_SIZE = 7;
  GLIBTOP_MAP_ENTRY_RSS = 8;
  GLIBTOP_MAP_ENTRY_SHARED_CLEAN = 9;
  GLIBTOP_MAP_ENTRY_SHARED_DIRTY = 10;
  GLIBTOP_MAP_ENTRY_PRIVATE_CLEAN = 11;
  GLIBTOP_MAP_ENTRY_PRIVATE_DIRTY = 12;
  GLIBTOP_MAP_ENTRY_PSS = 13;
  GLIBTOP_MAP_ENTRY_SWAP = 14;
  GLIBTOP_MAX_MAP_ENTRY = 15;
  GLIBTOP_MAP_FILENAME_LEN = 215;
  GLIBTOP_MAP_PERM_READ = 1;
  GLIBTOP_MAP_PERM_WRITE = 2;
  GLIBTOP_MAP_PERM_EXECUTE = 4;
  GLIBTOP_MAP_PERM_SHARED = 8;
  GLIBTOP_MAP_PERM_PRIVATE = 16;

type
  Tglibtop_map_entry = record
    flags: Tguint64;
    start: Tguint64;
    end_: Tguint64;
    offset: Tguint64;
    perm: Tguint64;
    inode: Tguint64;
    device: Tguint64;
    size: Tguint64;
    rss: Tguint64;
    shared_clean: Tguint64;
    shared_dirty: Tguint64;
    private_clean: Tguint64;
    private_dirty: Tguint64;
    pss: Tguint64;
    swap: Tguint64;
    filename: array[0..(GLIBTOP_MAP_FILENAME_LEN + 1) - 1] of char;
  end;
  Pglibtop_map_entry = ^Tglibtop_map_entry;

  Tglibtop_proc_map = record
    flags: Tguint64;
    number: Tguint64;
    total: Tguint64;
    size: Tguint64;
  end;
  Pglibtop_proc_map = ^Tglibtop_proc_map;

function glibtop_get_proc_map(buf: Pglibtop_proc_map; pid: Tpid_t): Pglibtop_map_entry; cdecl; external libgtop2;

function glibtop_get_proc_map_r(server: Pglibtop; buf: Pglibtop_proc_map; pid: Tpid_t): Pglibtop_map_entry; cdecl; external libgtop2 name 'glibtop_get_proc_map_s';

function glibtop_get_proc_map_l(server: Pglibtop; buf: Pglibtop_proc_map; pid: Tpid_t): Pglibtop_map_entry; cdecl; external libgtop2;

procedure _glibtop_init_proc_map_s(server: Pglibtop); cdecl; external libgtop2;
function glibtop_get_proc_map_s(server: Pglibtop; buf: Pglibtop_proc_map; pid: Tpid_t): Pglibtop_map_entry; cdecl; external libgtop2;

function glibtop_map_entry_get_type: TGType; cdecl; external libgtop2;
function glibtop_proc_map_get_type: TGType; cdecl; external libgtop2;

// === Konventiert am: 26-10-25 12:04:32 ===


implementation



end.
