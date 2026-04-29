unit semaphore;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_vips;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  TVipsSemaphore = record
    name: pchar;
    v: longint;
    mutex: PGMutex;
    cond: PGCond;
  end;
  PVipsSemaphore = ^TVipsSemaphore;
  {$ENDIF read_struct}

{$IFDEF read_function}
function vips_semaphore_up(s: PVipsSemaphore): longint; cdecl; external libvips;
function vips_semaphore_upn(s: PVipsSemaphore; n: longint): longint; cdecl; external libvips;
function vips_semaphore_down(s: PVipsSemaphore): longint; cdecl; external libvips;
function vips_semaphore_downn(s: PVipsSemaphore; n: longint): longint; cdecl; external libvips;
function vips_semaphore_down_timeout(s: PVipsSemaphore; timeout: Tgint64): longint; cdecl; external libvips;
procedure vips_semaphore_destroy(s: PVipsSemaphore); cdecl; external libvips;
procedure vips_semaphore_init(s: PVipsSemaphore; v: longint; name: pchar); cdecl; external libvips;
{$ENDIF read_function}

// === Konventiert am: 26-4-26 16:10:01 ===


implementation



end.
