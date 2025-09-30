unit soup_cache;

interface

uses
  fp_glib2, fp_soup, soup_message;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PSoupCacheability = ^TSoupCacheability;
  TSoupCacheability = longint;

const
  SOUP_CACHE_CACHEABLE = 1 shl 0;
  SOUP_CACHE_UNCACHEABLE = 1 shl 1;
  SOUP_CACHE_INVALIDATES = 1 shl 2;
  SOUP_CACHE_VALIDATES = 1 shl 3;

type
  PSoupCacheType = ^TSoupCacheType;
  TSoupCacheType = longint;

const
  SOUP_CACHE_SINGLE_USER = 0;
  SOUP_CACHE_SHARED = 1;

type
  TSoupCache = record
    parent_instance: TGObject;
  end;
  PSoupCache = ^TSoupCache;

  TSoupCacheClass = record
    parent_class: TGObjectClass;
    get_cacheability: function(cache: PSoupCache; msg: PSoupMessage): TSoupCacheability; cdecl;
    padding: array[0..3] of Tgpointer;
  end;
  PSoupCacheClass = ^TSoupCacheClass;

function soup_cache_get_type: TGType; cdecl; external libsoup;
function soup_cache_new(cache_dir: pchar; cache_type: TSoupCacheType): PSoupCache; cdecl; external libsoup;
procedure soup_cache_flush(cache: PSoupCache); cdecl; external libsoup;
procedure soup_cache_clear(cache: PSoupCache); cdecl; external libsoup;
procedure soup_cache_dump(cache: PSoupCache); cdecl; external libsoup;
procedure soup_cache_load(cache: PSoupCache); cdecl; external libsoup;
procedure soup_cache_set_max_size(cache: PSoupCache; max_size: Tguint); cdecl; external libsoup;
function soup_cache_get_max_size(cache: PSoupCache): Tguint; cdecl; external libsoup;

// === Konventiert am: 29-9-25 19:45:22 ===

function SOUP_TYPE_CACHE: TGType;
function SOUP_CACHE(obj: Pointer): PSoupCache;
function SOUP_IS_CACHE(obj: Pointer): Tgboolean;
function SOUP_CACHE_CLASS(klass: Pointer): PSoupCacheClass;
function SOUP_IS_CACHE_CLASS(klass: Pointer): Tgboolean;
function SOUP_CACHE_GET_CLASS(obj: Pointer): PSoupCacheClass;

implementation

function SOUP_TYPE_CACHE: TGType;
begin
  Result := soup_cache_get_type;
end;

function SOUP_CACHE(obj: Pointer): PSoupCache;
begin
  Result := PSoupCache(g_type_check_instance_cast(obj, SOUP_TYPE_CACHE));
end;

function SOUP_IS_CACHE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, SOUP_TYPE_CACHE);
end;

function SOUP_CACHE_CLASS(klass: Pointer): PSoupCacheClass;
begin
  Result := PSoupCacheClass(g_type_check_class_cast(klass, SOUP_TYPE_CACHE));
end;

function SOUP_IS_CACHE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, SOUP_TYPE_CACHE);
end;

function SOUP_CACHE_GET_CLASS(obj: Pointer): PSoupCacheClass;
begin
  Result := PSoupCacheClass(PGTypeInstance(obj)^.g_class);
end;



end.
