unit memory;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2,fp_vips,object_;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

{$IFDEF read_function}
function vips_malloc(obj: PVipsObject; size: Tsize_t): pointer; cdecl; external libvips;
function vips_strdup(obj: PVipsObject; str: pchar): pchar; cdecl; external libvips;
procedure vips_tracked_free(s: pointer); cdecl; external libvips;
procedure vips_tracked_aligned_free(s: pointer); cdecl; external libvips;
function vips_tracked_malloc(size: Tsize_t): pointer; cdecl; external libvips;
function vips_tracked_aligned_alloc(size: Tsize_t; align: Tsize_t): pointer; cdecl; external libvips;
function vips_tracked_get_mem: Tsize_t; cdecl; external libvips;
function vips_tracked_get_mem_highwater: Tsize_t; cdecl; external libvips;
function vips_tracked_get_allocs: longint; cdecl; external libvips;
function vips_tracked_open(pathname: pchar; flags: longint; mode: longint): longint; cdecl; external libvips;
function vips_tracked_close(fd: longint): longint; cdecl; external libvips;
function vips_tracked_get_files: longint; cdecl; external libvips;
{$ENDIF read_function}

// === Konventiert am: 26-4-26 16:12:10 ===


implementation



end.
