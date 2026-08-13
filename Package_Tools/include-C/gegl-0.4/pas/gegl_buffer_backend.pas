unit gegl_buffer_backend;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gegl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGeglTile = type Pointer;

  TGeglTileCallback = procedure(tile: PGeglTile; user_data: Tgpointer); cdecl;
  {$ENDIF read_struct}

  {$IFDEF read_enum}
type
  PGeglTileCommand = ^TGeglTileCommand;
  TGeglTileCommand = longint;
const
  GEGL_TILE_IDLE = 0;
  GEGL_TILE_SET = 1;
  GEGL_TILE_GET = 2;
  GEGL_TILE_IS_CACHED = 3;
  GEGL_TILE_EXIST = 4;
  GEGL_TILE_VOID = 5;
  GEGL_TILE_FLUSH = 6;
  GEGL_TILE_REFETCH = 7;
  GEGL_TILE_REINIT = 8;
  _GEGL_TILE_LAST_0_4_8_COMMAND = 9;
  GEGL_TILE_COPY = _GEGL_TILE_LAST_0_4_8_COMMAND;
  GEGL_TILE_LAST_COMMAND = (_GEGL_TILE_LAST_0_4_8_COMMAND) + 1;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGeglTileCopyParams = ^TGeglTileCopyParams;
  TGeglTileCopyParams = record
    dst_buffer: PGeglBuffer;
    dst_x: Tgint;
    dst_y: Tgint;
    dst_z: Tgint;
  end;
  {$ENDIF read_struct}


  // === Konventiert am: 12-8-26 14:30:58 ===


implementation



end.
