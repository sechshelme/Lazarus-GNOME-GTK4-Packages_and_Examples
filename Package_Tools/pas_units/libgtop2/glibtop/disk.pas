unit disk;

interface

uses
  fp_glib2, fp_libgtop2, glibtop;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  GLIBTOP_XDISK_SECTORS_READ = 0;
  GLIBTOP_XDISK_TIME_READ = 1;
  GLIBTOP_XDISK_SECTORS_WRITE = 2;
  GLIBTOP_XDISK_TIME_WRITE = 3;
  GLIBTOP_MAX_DISK = 4;

  GLIBTOP_NDISK = 1024;

type
  Tpartition_info = record
    name: array[0..255] of char;
    _type: array[0..255] of char;
    raid_num: array[0..255] of char;
    max: longint;
  end;
  Ppartition_info = ^Tpartition_info;

  Tglibtop_disk = record
    flags: Tguint64;
    xdisk_sectors_read: array[0..(GLIBTOP_NDISK) - 1] of Tguint64;
    xdisk_time_read: array[0..(GLIBTOP_NDISK) - 1] of Tguint64;
    xdisk_sectors_write: array[0..(GLIBTOP_NDISK) - 1] of Tguint64;
    xdisk_time_write: array[0..(GLIBTOP_NDISK) - 1] of Tguint64;
    xdisk_flags: Tguint64;
  end;
  Pglibtop_disk = ^Tglibtop_disk;

procedure glibtop_get_disk(buf: Pglibtop_disk); cdecl; external libgtop2;

procedure glibtop_get_disk_r(server: Pglibtop; buf: Pglibtop_disk); cdecl; external libgtop2 name 'glibtop_get_disk_s';

procedure glibtop_get_disk_l(server: Pglibtop; buf: Pglibtop_disk); cdecl; external libgtop2;

procedure _glibtop_init_disk_s(server: Pglibtop); cdecl; external libgtop2;
procedure glibtop_get_disk_s(server: Pglibtop; buf: Pglibtop_disk); cdecl; external libgtop2;

// === Konventiert am: 26-10-25 12:05:32 ===


implementation



end.
