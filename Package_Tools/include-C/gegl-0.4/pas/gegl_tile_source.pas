unit gegl_tile_source;

interface

uses
  fp_glib2, fp_gegl, gegl_buffer_backend;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PGeglTileSource = ^TGeglTileSource;

  TGeglTileSourceCommand = function(gegl_tile_source: PGeglTileSource; command: TGeglTileCommand; x: Tgint; y: Tgint; z: Tgint; data: Tgpointer): Tgpointer; cdecl;

  TGeglTileSource = record
    parent_instance: TGObject;
    command: TGeglTileSourceCommand;
    padding: array[0..3] of Tgpointer;
  end;

  PGeglTileSourceClass = ^TGeglTileSourceClass;
  TGeglTileSourceClass = record
    parent_class: TGObjectClass;
    padding: array[0..3] of Tgpointer;
  end;

function gegl_tile_source_get_type: TGType; cdecl; external libgegl;
function gegl_buffer_get_tile(buffer: PGeglBuffer; x: Tgint; y: Tgint; z: Tgint): PGeglTile; cdecl; external libgegl;

function gegl_tile_source_command(source: PGeglTileSource; command: TGeglTileCommand; x, y, z: TGint; data: Tgpointer): Tgpointer;
function gegl_tile_source_get_tile(source: PGeglTileSource; x, y, z: TGint): PGeglTile;

function gegl_tile_source_set_tile(source: PGeglTileSource; x, y, z: TGint; tile: PGeglTile): boolean; inline;
function gegl_tile_source_is_cached(source: PGeglTileSource; x, y, z: TGint): boolean; inline;
function gegl_tile_source_exist(source: PGeglTileSource; x, y, z: TGint): boolean; inline;
procedure gegl_tile_source_reinit(source: PGeglTileSource); inline;
procedure gegl_tile_source_void(source: PGeglTileSource; x, y, z: TGint); inline;
function gegl_tile_source_copy(source: PGeglTileSource; x, y, z: TGint; dst_buffer: PGeglBuffer; dst_x, dst_y, dst_z: TGint): boolean; inline;
procedure gegl_tile_source_refetch(source: PGeglTileSource; x, y, z: TGint); inline;
function gegl_tile_source_idle(source: PGeglTileSource): boolean; inline;

// === Konventiert am: 12-8-26 17:16:42 ===

function GEGL_TYPE_TILE_SOURCE: TGType;
function GEGL_TILE_SOURCE(obj: Pointer): PGeglTileSource;
function GEGL_TILE_SOURCE_CLASS(klass: Pointer): PGeglTileSourceClass;
function GEGL_IS_TILE_SOURCE(obj: Pointer): Tgboolean;
function GEGL_IS_TILE_SOURCE_CLASS(klass: Pointer): Tgboolean;
function GEGL_TILE_SOURCE_GET_CLASS(obj: Pointer): PGeglTileSourceClass;

implementation

function gegl_tile_source_command(source: PGeglTileSource; command: TGeglTileCommand; x, y, z: TGint; data: Tgpointer): Tgpointer;
begin
  Result := source^.command(source, command, x, y, z, data);
end;

function gegl_tile_source_get_tile(source: PGeglTileSource; x, y, z: TGint): PGeglTile;
var
  tile: PGeglTile;
begin
  tile := PGeglTile(gegl_tile_source_command(source, GEGL_TILE_GET, x, y, z, nil));
  Result := tile;
end;


function gegl_tile_source_set_tile(source: PGeglTileSource; x, y, z: TGint; tile: PGeglTile): boolean;
begin
  Result := gegl_tile_source_command(source, GEGL_TILE_SET, x, y, z, tile) <> nil;
end;

function gegl_tile_source_is_cached(source: PGeglTileSource; x, y, z: TGint): boolean;
begin
  Result := gegl_tile_source_command(source, GEGL_TILE_IS_CACHED, x, y, z, nil) <> nil;
end;

function gegl_tile_source_exist(source: PGeglTileSource; x, y, z: TGint): boolean;
begin
  Result := gegl_tile_source_command(source, GEGL_TILE_EXIST, x, y, z, nil) <> nil;
end;

procedure gegl_tile_source_reinit(source: PGeglTileSource);
begin
  gegl_tile_source_command(source, GEGL_TILE_REINIT, 0, 0, 0, nil);
end;

procedure gegl_tile_source_void(source: PGeglTileSource; x, y, z: TGint);
begin
  gegl_tile_source_command(source, GEGL_TILE_VOID, x, y, z, nil);
end;

function gegl_tile_source_copy(source: PGeglTileSource; x, y, z: TGint; dst_buffer: PGeglBuffer; dst_x, dst_y, dst_z: TGint): boolean;
var
  params: TGeglTileCopyParams;
begin
  params.dst_buffer := dst_buffer;
  params.dst_x := dst_x;
  params.dst_y := dst_y;
  params.dst_z := dst_z;
  if gegl_tile_source_command(source, GEGL_TILE_COPY, x, y, z, @params) <> nil then begin Result := True; end else begin Result := False; end;
end;

procedure gegl_tile_source_refetch(source: PGeglTileSource; x, y, z: TGint);
begin
  gegl_tile_source_command(source, GEGL_TILE_REFETCH, x, y, z, nil);
end;

function gegl_tile_source_idle(source: PGeglTileSource): boolean;
begin
  Result := gegl_tile_source_command(source, GEGL_TILE_IDLE, 0, 0, 0, nil) <> nil;
end;


function GEGL_TYPE_TILE_SOURCE: TGType;
begin
  GEGL_TYPE_TILE_SOURCE := gegl_tile_source_get_type;
end;

function GEGL_TILE_SOURCE(obj: Pointer): PGeglTileSource;
begin
  Result := PGeglTileSource(g_type_check_instance_cast(obj, GEGL_TYPE_TILE_SOURCE));
end;

function GEGL_TILE_SOURCE_CLASS(klass: Pointer): PGeglTileSourceClass;
begin
  Result := PGeglTileSourceClass(g_type_check_class_cast(klass, GEGL_TYPE_TILE_SOURCE));
end;

function GEGL_IS_TILE_SOURCE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEGL_TYPE_TILE_SOURCE);
end;

function GEGL_IS_TILE_SOURCE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GEGL_TYPE_TILE_SOURCE);
end;

function GEGL_TILE_SOURCE_GET_CLASS(obj: Pointer): PGeglTileSourceClass;
begin
  Result := PGeglTileSourceClass(PGTypeInstance(obj)^.g_class);
end;



end.
