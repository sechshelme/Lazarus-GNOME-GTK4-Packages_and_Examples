

  {$IFDEF read_struct}
type
  PGeglTileBackendPrivate = type Pointer;

  PGeglTileBackend = ^TGeglTileBackend;
  TGeglTileBackend = record
    parent_instance: TGeglTileSource;
    priv: PGeglTileBackendPrivate;
  end;

  PGeglTileBackendClass = ^TGeglTileBackendClass;
  TGeglTileBackendClass = record
    parent_class: TGeglTileSourceClass;
    padding: array[0..3] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gegl_tile_backend_get_tile_size(tile_backend: PGeglTileBackend): Tgint; cdecl; external libgegl;
function gegl_tile_backend_get_tile_width(tile_backend: PGeglTileBackend): Tgint; cdecl; external libgegl;
function gegl_tile_backend_get_tile_height(tile_backend: PGeglTileBackend): Tgint; cdecl; external libgegl;
function gegl_tile_backend_get_format(tile_backend: PGeglTileBackend): PBabl; cdecl; external libgegl;
function gegl_tile_backend_peek_storage(tile_backend: PGeglTileBackend): PGeglTileSource; cdecl; external libgegl;
procedure gegl_tile_backend_set_extent(tile_backend: PGeglTileBackend; rectangle: PGeglRectangle); cdecl; external libgegl;
function gegl_tile_backend_get_extent(tile_backend: PGeglTileBackend): TGeglRectangle; cdecl; external libgegl;
procedure gegl_tile_backend_set_flush_on_destroy(tile_backend: PGeglTileBackend; flush_on_destroy: Tgboolean); cdecl; external libgegl;
function gegl_tile_backend_get_flush_on_destroy(tile_backend: PGeglTileBackend): Tgboolean; cdecl; external libgegl;
function gegl_tile_backend_command(backend: PGeglTileBackend; command: TGeglTileCommand; x: Tgint; y: Tgint; z: Tgint;
  data: Tgpointer): Tgpointer; cdecl; external libgegl;
function gegl_tile_backend_get_type: TGType; cdecl; external libgegl;
procedure gegl_tile_backend_unlink_swap(path: Pgchar); cdecl; external libgegl; deprecated;

// === Konventiert am: 12-8-26 17:16:57 ===

function GEGL_TYPE_TILE_BACKEND: TGType;
function GEGL_TILE_BACKEND(obj: Pointer): PGeglTileBackend;
function GEGL_TILE_BACKEND_CLASS(klass: Pointer): PGeglTileBackendClass;
function GEGL_IS_TILE_BACKEND(obj: Pointer): Tgboolean;
function GEGL_IS_TILE_BACKEND_CLASS(klass: Pointer): Tgboolean;
function GEGL_TILE_BACKEND_GET_CLASS(obj: Pointer): PGeglTileBackendClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GEGL_TYPE_TILE_BACKEND: TGType;
begin
  GEGL_TYPE_TILE_BACKEND := gegl_tile_backend_get_type;
end;

function GEGL_TILE_BACKEND(obj: Pointer): PGeglTileBackend;
begin
  Result := PGeglTileBackend(g_type_check_instance_cast(obj, GEGL_TYPE_TILE_BACKEND));
end;

function GEGL_TILE_BACKEND_CLASS(klass: Pointer): PGeglTileBackendClass;
begin
  Result := PGeglTileBackendClass(g_type_check_class_cast(klass, GEGL_TYPE_TILE_BACKEND));
end;

function GEGL_IS_TILE_BACKEND(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEGL_TYPE_TILE_BACKEND);
end;

function GEGL_IS_TILE_BACKEND_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GEGL_TYPE_TILE_BACKEND);
end;

function GEGL_TILE_BACKEND_GET_CLASS(obj: Pointer): PGeglTileBackendClass;
begin
  Result := PGeglTileBackendClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
