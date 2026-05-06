{$IFDEF read_interface}


function shumate_file_cache_error_quark: TGQuark; cdecl; external libshumate;

type
  PShumateFileCacheError = ^TShumateFileCacheError;
  TShumateFileCacheError = longint;

const
  SHUMATE_FILE_CACHE_ERROR_FAILED = 0;

type
  TShumateFileCache = record
  end;
  PShumateFileCache = ^TShumateFileCache;

  TShumateFileCacheClass = record
    parent_class: TGObjectClass;
  end;
  PShumateFileCacheClass = ^TShumateFileCacheClass;

function shumate_file_cache_get_type: TGType; cdecl; external libshumate;
function shumate_file_cache_new_full(size_limit: Tguint; cache_key: pchar; cache_dir: pchar): PShumateFileCache; cdecl; external libshumate;
function shumate_file_cache_get_size_limit(self: PShumateFileCache): Tguint; cdecl; external libshumate;
procedure shumate_file_cache_set_size_limit(self: PShumateFileCache; size_limit: Tguint); cdecl; external libshumate;
function shumate_file_cache_get_cache_dir(self: PShumateFileCache): pchar; cdecl; external libshumate;
function shumate_file_cache_get_cache_key(self: PShumateFileCache): pchar; cdecl; external libshumate;
procedure shumate_file_cache_purge_cache_async(self: PShumateFileCache; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libshumate;
function shumate_file_cache_purge_cache_finish(self: PShumateFileCache; result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libshumate;
procedure shumate_file_cache_get_tile_async(self: PShumateFileCache; x: longint; y: longint; zoom_level: longint; cancellable: PGCancellable;
  callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libshumate;
function shumate_file_cache_get_tile_finish(self: PShumateFileCache; etag: PPchar; modtime: PPGDateTime; result: PGAsyncResult; error: PPGError): PGBytes; cdecl; external libshumate;
procedure shumate_file_cache_store_tile_async(self: PShumateFileCache; x: longint; y: longint; zoom_level: longint; bytes: PGBytes;
  etag: pchar; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libshumate;
function shumate_file_cache_store_tile_finish(self: PShumateFileCache; result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libshumate;
procedure shumate_file_cache_mark_up_to_date(self: PShumateFileCache; x: longint; y: longint; zoom_level: longint); cdecl; external libshumate;

// === Konventiert am: 6-5-26 15:49:40 ===

function SHUMATE_TYPE_FILE_CACHE: TGType;
function SHUMATE_FILE_CACHE(obj: Pointer): PShumateFileCache;
function SHUMATE_IS_FILE_CACHE(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function SHUMATE_TYPE_FILE_CACHE: TGType;
begin
  Result := shumate_file_cache_get_type;
end;

function SHUMATE_FILE_CACHE(obj: Pointer): PShumateFileCache;
begin
  Result := PShumateFileCache(g_type_check_instance_cast(obj, SHUMATE_TYPE_FILE_CACHE));
end;

function SHUMATE_IS_FILE_CACHE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, SHUMATE_TYPE_FILE_CACHE);
end;


{$ENDIF read_implementation}
