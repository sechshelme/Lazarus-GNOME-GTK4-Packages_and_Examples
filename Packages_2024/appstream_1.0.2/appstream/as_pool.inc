

  {$IFDEF read_enum}
type
  PAsPoolFlags = ^TAsPoolFlags;
  TAsPoolFlags = longint;
const
  AS_POOL_FLAG_NONE = 0;
  AS_POOL_FLAG_LOAD_OS_CATALOG = 1 shl 0;
  AS_POOL_FLAG_LOAD_OS_METAINFO = 1 shl 1;
  AS_POOL_FLAG_LOAD_OS_DESKTOP_FILES = 1 shl 2;
  AS_POOL_FLAG_LOAD_FLATPAK = 1 shl 3;
  AS_POOL_FLAG_IGNORE_CACHE_AGE = 1 shl 4;
  AS_POOL_FLAG_RESOLVE_ADDONS = 1 shl 5;
  AS_POOL_FLAG_PREFER_OS_METAINFO = 1 shl 6;
  AS_POOL_FLAG_MONITOR = 1 shl 7;

type
  PAsCacheFlags = ^TAsCacheFlags;
  TAsCacheFlags = longint;
const
  AS_CACHE_FLAG_NONE = 0;
  AS_CACHE_FLAG_USE_USER = 1 shl 0;
  AS_CACHE_FLAG_USE_SYSTEM = 1 shl 1;
  AS_CACHE_FLAG_NO_CLEAR = 1 shl 2;
  AS_CACHE_FLAG_REFRESH_SYSTEM = 1 shl 3;

type
  PAsPoolError = ^TAsPoolError;
  TAsPoolError = longint;
const
  AS_POOL_ERROR_FAILED = 0;
  AS_POOL_ERROR_INCOMPLETE = 1;
  AS_POOL_ERROR_COLLISION = 2;
  AS_POOL_ERROR_CACHE_WRITE_FAILED = 3;
  AS_POOL_ERROR_CACHE_DAMAGED = 4;
  AS_POOL_ERROR_LAST = 5;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  TAsPool = record
    parent_instance: TGObject;
  end;
  PAsPool = ^TAsPool;

  PAsPoolClass = ^TAsPoolClass;
  TAsPoolClass = record
    parent_class: TGObjectClass;
    changed: procedure(pool: PAsPool); cdecl;
    _as_reserved1: procedure; cdecl;
    _as_reserved2: procedure; cdecl;
    _as_reserved3: procedure; cdecl;
    _as_reserved4: procedure; cdecl;
    _as_reserved5: procedure; cdecl;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function as_pool_get_type: TGType; cdecl; external libappstream;
function as_pool_error_quark: TGQuark; cdecl; external libappstream;
function as_pool_new: PAsPool; cdecl; external libappstream;
function as_pool_get_locale(pool: PAsPool): Pgchar; cdecl; external libappstream;
procedure as_pool_set_locale(pool: PAsPool; locale: Pgchar); cdecl; external libappstream;
function as_pool_load(pool: PAsPool; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libappstream;
procedure as_pool_load_async(pool: PAsPool; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libappstream;
function as_pool_load_finish(pool: PAsPool; result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libappstream;
function as_pool_is_empty(pool: PAsPool): Tgboolean; cdecl; external libappstream;
procedure as_pool_clear(pool: PAsPool); cdecl; external libappstream;
function as_pool_add_components(pool: PAsPool; cbox: PAsComponentBox; error: PPGError): Tgboolean; cdecl; external libappstream;
function as_pool_get_components(pool: PAsPool): PAsComponentBox; cdecl; external libappstream;
function as_pool_get_components_by_id(pool: PAsPool; cid: Pgchar): PAsComponentBox; cdecl; external libappstream;
function as_pool_get_components_by_provided_item(pool: PAsPool; kind: TAsProvidedKind; item: Pgchar): PAsComponentBox; cdecl; external libappstream;
function as_pool_get_components_by_kind(pool: PAsPool; kind: TAsComponentKind): PAsComponentBox; cdecl; external libappstream;
function as_pool_get_components_by_categories(pool: PAsPool; categories: PPgchar): PAsComponentBox; cdecl; external libappstream;
function as_pool_get_components_by_launchable(pool: PAsPool; kind: TAsLaunchableKind; id: Pgchar): PAsComponentBox; cdecl; external libappstream;
function as_pool_get_components_by_extends(pool: PAsPool; extended_id: Pgchar): PAsComponentBox; cdecl; external libappstream;
function as_pool_get_components_by_bundle_id(pool: PAsPool; kind: TAsBundleKind; bundle_id: Pgchar; match_prefix: Tgboolean): PAsComponentBox; cdecl; external libappstream;
function as_pool_search(pool: PAsPool; search: Pgchar): PAsComponentBox; cdecl; external libappstream;
function as_pool_build_search_tokens(pool: PAsPool; search: Pgchar): PPgchar; cdecl; external libappstream;
procedure as_pool_reset_extra_data_locations(pool: PAsPool); cdecl; external libappstream;
procedure as_pool_add_extra_data_location(pool: PAsPool; directory: Pgchar; format_style: TAsFormatStyle); cdecl; external libappstream;
function as_pool_get_flags(pool: PAsPool): TAsPoolFlags; cdecl; external libappstream;
procedure as_pool_set_flags(pool: PAsPool; flags: TAsPoolFlags); cdecl; external libappstream;
procedure as_pool_add_flags(pool: PAsPool; flags: TAsPoolFlags); cdecl; external libappstream;
procedure as_pool_remove_flags(pool: PAsPool; flags: TAsPoolFlags); cdecl; external libappstream;
procedure as_pool_set_load_std_data_locations(pool: PAsPool; enabled: Tgboolean); cdecl; external libappstream;

// === Konventiert am: 30-7-26 19:35:43 ===

function AS_TYPE_POOL: TGType;
function AS_POOL(obj: Pointer): PAsPool;
function AS_IS_POOL(obj: Pointer): Tgboolean;
function AS_POOL_CLASS(klass: Pointer): PAsPoolClass;
function AS_IS_POOL_CLASS(klass: Pointer): Tgboolean;
function AS_POOL_GET_CLASS(obj: Pointer): PAsPoolClass;

function AS_POOL_ERROR: TGQuark;
{$ENDIF read_function}


{$IFDEF read_implementation}

function AS_TYPE_POOL: TGType;
begin
  Result := as_pool_get_type;
end;

function AS_POOL(obj: Pointer): PAsPool;
begin
  Result := PAsPool(g_type_check_instance_cast(obj, AS_TYPE_POOL));
end;

function AS_IS_POOL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, AS_TYPE_POOL);
end;

function AS_POOL_CLASS(klass: Pointer): PAsPoolClass;
begin
  Result := PAsPoolClass(g_type_check_class_cast(klass, AS_TYPE_POOL));
end;

function AS_IS_POOL_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, AS_TYPE_POOL);
end;

function AS_POOL_GET_CLASS(obj: Pointer): PAsPoolClass;
begin
  Result := PAsPoolClass(PGTypeInstance(obj)^.g_class);
end;


function AS_POOL_ERROR: TGQuark;
begin
  AS_POOL_ERROR := as_pool_error_quark;
end;

{$ENDIF read_implementation}
