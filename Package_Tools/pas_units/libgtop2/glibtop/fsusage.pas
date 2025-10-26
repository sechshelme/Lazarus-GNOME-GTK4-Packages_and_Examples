unit fsusage;

interface

uses
  fp_glib2, fp_libgtop2, glibtop;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  GLIBTOP_FSUSAGE_BLOCKS = 0;
  GLIBTOP_FSUSAGE_BFREE = 1;
  GLIBTOP_FSUSAGE_BAVAIL = 2;
  GLIBTOP_FSUSAGE_FILES = 3;
  GLIBTOP_FSUSAGE_FFREE = 4;
  GLIBTOP_FSUSAGE_BLOCK_SIZE = 5;
  GLIBTOP_FSUSAGE_READ = 6;
  GLIBTOP_FSUSAGE_WRITE = 7;
  GLIBTOP_MAX_FSUSAGE = 8;

type
  Tglibtop_fsusage = record
    flags: Tguint64;
    blocks: Tguint64;
    bfree: Tguint64;
    bavail: Tguint64;
    files: Tguint64;
    ffree: Tguint64;
    block_size: Tguint32;
    read: Tguint64;
    write: Tguint64;
  end;
  Pglibtop_fsusage = ^Tglibtop_fsusage;

procedure glibtop_get_fsusage(buf: Pglibtop_fsusage; mount_dir: pchar); cdecl; external libgtop2;

procedure glibtop_get_fsusage_r(server: Pglibtop; buf: Pglibtop_fsusage; mount_dir: pchar); cdecl; external libgtop2 name 'glibtop_get_fsusage_s';

procedure glibtop_get_fsusage_l(server: Pglibtop; buf: Pglibtop_fsusage; mount_dir: pchar); cdecl; external libgtop2;
procedure glibtop_get_fsusage_s(server: Pglibtop; buf: Pglibtop_fsusage; mount_dir: pchar); cdecl; external libgtop2;

// === Konventiert am: 26-10-25 12:05:29 ===


implementation



end.
