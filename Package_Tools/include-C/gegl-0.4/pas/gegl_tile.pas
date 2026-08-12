unit gegl_tile;

interface

uses
  fp_glib2, fp_gegl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function gegl_tile_new(size: Tgint): PGeglTile; cdecl; external libgegl;
function gegl_tile_new_bare: PGeglTile; cdecl; external libgegl;
function gegl_tile_ref(tile: PGeglTile): PGeglTile; cdecl; external libgegl;
procedure gegl_tile_unref(tile: PGeglTile); cdecl; external libgegl;
procedure gegl_tile_lock(tile: PGeglTile); cdecl; external libgegl;
procedure gegl_tile_unlock(tile: PGeglTile); cdecl; external libgegl;
procedure gegl_tile_read_lock(tile: PGeglTile); cdecl; external libgegl;
procedure gegl_tile_read_unlock(tile: PGeglTile); cdecl; external libgegl;
procedure gegl_tile_mark_as_stored(tile: PGeglTile); cdecl; external libgegl;
function gegl_tile_is_stored(tile: PGeglTile): Tgboolean; cdecl; external libgegl;
function gegl_tile_store(tile: PGeglTile): Tgboolean; cdecl; external libgegl;
procedure gegl_tile_void(tile: PGeglTile); cdecl; external libgegl;
function gegl_tile_dup(tile: PGeglTile): PGeglTile; cdecl; external libgegl;
procedure gegl_tile_set_rev(tile: PGeglTile; rev: Tguint); cdecl; external libgegl;
function gegl_tile_get_rev(tile: PGeglTile): Tguint; cdecl; external libgegl;
function gegl_tile_get_data(tile: PGeglTile): Pguchar; cdecl; external libgegl;
procedure gegl_tile_set_data(tile: PGeglTile; pixel_data: Tgpointer; pixel_data_size: Tgint); cdecl; external libgegl;
procedure gegl_tile_set_data_full(tile: PGeglTile; pixel_data: Tgpointer; pixel_data_size: Tgint; destroy_notify: TGDestroyNotify; destroy_notify_data: Tgpointer); cdecl; external libgegl;
procedure gegl_tile_set_unlock_notify(tile: PGeglTile; unlock_notify: TGeglTileCallback; unlock_notify_data: Tgpointer); cdecl; external libgegl;

// === Konventiert am: 12-8-26 17:17:11 ===


implementation



end.
