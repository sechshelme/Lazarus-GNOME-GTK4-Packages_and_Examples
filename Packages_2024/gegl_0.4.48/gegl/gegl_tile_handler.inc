

  {$IFDEF read_struct}
type
  PGeglTileHandlerPrivate = type Pointer;

  PGeglTileHandler = ^TGeglTileHandler;
  TGeglTileHandler = record
    parent_instance: TGeglTileSource;
    source: PGeglTileSource;
    priv: PGeglTileHandlerPrivate;
  end;

  PGeglTileHandlerClass = ^TGeglTileHandlerClass;
  TGeglTileHandlerClass = record
    parent_class: TGeglTileSourceClass;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gegl_tile_handler_get_type: TGType; cdecl; external libgegl;
procedure gegl_tile_handler_set_source(handler: PGeglTileHandler; source: PGeglTileSource); cdecl; external libgegl;

function gegl_tile_handler_create_tile(handler: PGeglTileHandler; x: Tgint; y: Tgint; z: Tgint): PGeglTile; cdecl; external libgegl;
function gegl_tile_handler_get_tile(handler: PGeglTileHandler; x: Tgint; y: Tgint; z: Tgint; preserve_data: Tgboolean): PGeglTile; cdecl; external libgegl;
function gegl_tile_handler_get_source_tile(handler: PGeglTileHandler; x: Tgint; y: Tgint; z: Tgint; preserve_data: Tgboolean): PGeglTile; cdecl; external libgegl;
function gegl_tile_handler_dup_tile(handler: PGeglTileHandler; tile: PGeglTile; x: Tgint; y: Tgint; z: Tgint): PGeglTile; cdecl; external libgegl;
procedure gegl_tile_handler_damage_tile(handler: PGeglTileHandler; x: Tgint; y: Tgint; z: Tgint; damage: Tguint64); cdecl; external libgegl;
procedure gegl_tile_handler_damage_rect(handler: PGeglTileHandler; rect: PGeglRectangle); cdecl; external libgegl;
procedure gegl_tile_handler_lock(handler: PGeglTileHandler); cdecl; external libgegl;
procedure gegl_tile_handler_unlock(handler: PGeglTileHandler); cdecl; external libgegl;

function gegl_tile_handler_get_source(handler: Pointer): PGeglTileSource;
function gegl_tile_handler_source_command(handler: PGeglTileHandler; command: TGeglTileCommand; x, y, z: longint; data: Pointer): Pointer; cdecl; inline;

// === Konventiert am: 12-8-26 17:16:50 ===

function GEGL_TYPE_TILE_HANDLER: TGType;
function GEGL_TILE_HANDLER(obj: Pointer): PGeglTileHandler;
function GEGL_TILE_HANDLER_CLASS(klass: Pointer): PGeglTileHandlerClass;
function GEGL_IS_TILE_HANDLER(obj: Pointer): Tgboolean;
function GEGL_IS_TILE_HANDLER_CLASS(klass: Pointer): Tgboolean;
function GEGL_TILE_HANDLER_GET_CLASS(obj: Pointer): PGeglTileHandlerClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GEGL_TYPE_TILE_HANDLER: TGType;
begin
  GEGL_TYPE_TILE_HANDLER := gegl_tile_handler_get_type;
end;

function GEGL_TILE_HANDLER(obj: Pointer): PGeglTileHandler;
begin
  Result := PGeglTileHandler(g_type_check_instance_cast(obj, GEGL_TYPE_TILE_HANDLER));
end;

function GEGL_TILE_HANDLER_CLASS(klass: Pointer): PGeglTileHandlerClass;
begin
  Result := PGeglTileHandlerClass(g_type_check_class_cast(klass, GEGL_TYPE_TILE_HANDLER));
end;

function GEGL_IS_TILE_HANDLER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEGL_TYPE_TILE_HANDLER);
end;

function GEGL_IS_TILE_HANDLER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GEGL_TYPE_TILE_HANDLER);
end;

function GEGL_TILE_HANDLER_GET_CLASS(obj: Pointer): PGeglTileHandlerClass;
begin
  Result := PGeglTileHandlerClass(PGTypeInstance(obj)^.g_class);
end;


function gegl_tile_handler_get_source(handler: Pointer): PGeglTileSource;
begin
  gegl_tile_handler_get_source := (PGeglTileHandler(handler))^.source;
end;

function gegl_tile_handler_source_command(handler: PGeglTileHandler; command: TGeglTileCommand; x, y, z: longint; data: Pointer): Pointer; cdecl; inline;
var
  source: PGeglTileSource;
begin
  source := gegl_tile_handler_get_source(handler);

  if source <> nil then begin Result := gegl_tile_source_command(source, command, x, y, z, data); end else begin Result := nil; end;
end;

{$ENDIF read_implementation}
