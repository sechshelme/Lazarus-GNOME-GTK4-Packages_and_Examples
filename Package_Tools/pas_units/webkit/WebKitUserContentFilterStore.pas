unit WebKitUserContentFilterStore;

interface

uses
  fp_glib2, fp_GTK4, WebKit;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {WEBKIT_DECLARE_FINAL_TYPE (WebKitUserContentFilterStore, webkit_user_content_filter_store, WEBKIT, USER_CONTENT_FILTER_STORE, GObject) }
type
  TWebKitUserContentFilterStore = record
  end;
  PWebKitUserContentFilterStore = ^TWebKitUserContentFilterStore;

  TWebKitUserContentFilterStoreClass = record
    parent_class: TGObjectClass;
  end;
  PWebKitUserContentFilterStoreClass = ^TWebKitUserContentFilterStoreClass;

  TWebKitUserContentFilter = record
  end;
  PWebKitUserContentFilter = ^TWebKitUserContentFilter;

function webkit_user_content_filter_store_get_type: TGType; cdecl; external libwebkit;
function webkit_user_content_filter_store_new(storage_path: Pgchar): PWebKitUserContentFilterStore; cdecl; external libwebkit;
function webkit_user_content_filter_store_get_path(store: PWebKitUserContentFilterStore): Pgchar; cdecl; external libwebkit;
procedure webkit_user_content_filter_store_save(store: PWebKitUserContentFilterStore; identifier: Pgchar; Source: PGBytes; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
  user_data: Tgpointer); cdecl; external libwebkit;
function webkit_user_content_filter_store_save_finish(store: PWebKitUserContentFilterStore; Result: PGAsyncResult; error: PPGError): PWebKitUserContentFilter; cdecl; external libwebkit;
procedure webkit_user_content_filter_store_save_from_file(store: PWebKitUserContentFilterStore; identifier: Pgchar; file_: PGFile; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
  user_data: Tgpointer); cdecl; external libwebkit;
function webkit_user_content_filter_store_save_from_file_finish(store: PWebKitUserContentFilterStore; Result: PGAsyncResult; error: PPGError): PWebKitUserContentFilter; cdecl; external libwebkit;
procedure webkit_user_content_filter_store_remove(store: PWebKitUserContentFilterStore; identifier: Pgchar; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libwebkit;
function webkit_user_content_filter_store_remove_finish(store: PWebKitUserContentFilterStore; Result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libwebkit;
procedure webkit_user_content_filter_store_load(store: PWebKitUserContentFilterStore; identifier: Pgchar; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libwebkit;
function webkit_user_content_filter_store_load_finish(store: PWebKitUserContentFilterStore; Result: PGAsyncResult; error: PPGError): PWebKitUserContentFilter; cdecl; external libwebkit;
procedure webkit_user_content_filter_store_fetch_identifiers(store: PWebKitUserContentFilterStore; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libwebkit;
function webkit_user_content_filter_store_fetch_identifiers_finish(store: PWebKitUserContentFilterStore; Result: PGAsyncResult): PPgchar; cdecl; external libwebkit;

// === Konventiert am: 4-1-25 13:43:07 ===

function WEBKIT_TYPE_USER_CONTENT_FILTER_STORE: TGType;
function WEBKIT_USER_CONTENT_FILTER_STORE(obj: Pointer): PWebKitUserContentFilterStore;
function WEBKIT_IS_USER_CONTENT_FILTER_STORE(obj: Pointer): Tgboolean;

implementation

function WEBKIT_TYPE_USER_CONTENT_FILTER_STORE: TGType;
begin
  Result := webkit_user_content_filter_store_get_type;
end;

function WEBKIT_USER_CONTENT_FILTER_STORE(obj: Pointer): PWebKitUserContentFilterStore;
begin
  Result := PWebKitUserContentFilterStore(g_type_check_instance_cast(obj, WEBKIT_TYPE_USER_CONTENT_FILTER_STORE));
end;

function WEBKIT_IS_USER_CONTENT_FILTER_STORE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, WEBKIT_TYPE_USER_CONTENT_FILTER_STORE);
end;


end.
