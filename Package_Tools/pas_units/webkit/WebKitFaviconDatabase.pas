unit WebKitFaviconDatabase;

interface

uses
  fp_glib2, fp_GDK4, fp_GTK4, web_common;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {WEBKIT_DECLARE_FINAL_TYPE (WebKitFaviconDatabase, webkit_favicon_database, WEBKIT, FAVICON_DATABASE, GObject) }

type
  PWebKitFaviconDatabaseError = ^TWebKitFaviconDatabaseError;
  TWebKitFaviconDatabaseError = longint;

const
  WEBKIT_FAVICON_DATABASE_ERROR_NOT_INITIALIZED = 0;
  WEBKIT_FAVICON_DATABASE_ERROR_FAVICON_NOT_FOUND = 1;
  WEBKIT_FAVICON_DATABASE_ERROR_FAVICON_UNKNOWN = 2;

type
  TWebKitFaviconDatabase = record
  end;
  PWebKitFaviconDatabase = ^TWebKitFaviconDatabase;

  TWebKitFaviconDatabaseClass = record
    parent_class: TGObjectClass;
  end;
  PWebKitFaviconDatabaseClass = ^TWebKitFaviconDatabaseClass;

function webkit_favicon_database_get_type: TGType; cdecl; external libwebkit;
function webkit_favicon_database_error_quark: TGQuark; cdecl; external libwebkit;
procedure webkit_favicon_database_get_favicon(database: PWebKitFaviconDatabase; page_uri: Pgchar; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libwebkit;
function webkit_favicon_database_get_favicon_finish(database: PWebKitFaviconDatabase; Result: PGAsyncResult; error: PPGError): PGdkTexture; cdecl; external libwebkit;
function webkit_favicon_database_get_favicon_uri(database: PWebKitFaviconDatabase; page_uri: Pgchar): Pgchar; cdecl; external libwebkit;
procedure webkit_favicon_database_clear(database: PWebKitFaviconDatabase); cdecl; external libwebkit;

function WEBKIT_FAVICON_DATABASE_ERROR: TGQuark;

// === Konventiert am: 3-1-25 17:37:35 ===

function WEBKIT_TYPE_FAVICON_DATABASE: TGType;
function WEBKIT_FAVICON_DATABASE(obj: Pointer): PWebKitFaviconDatabase;
function WEBKIT_IS_FAVICON_DATABASE(obj: Pointer): Tgboolean;

implementation

function WEBKIT_TYPE_FAVICON_DATABASE: TGType;
begin
  Result := webkit_favicon_database_get_type;
end;

function WEBKIT_FAVICON_DATABASE(obj: Pointer): PWebKitFaviconDatabase;
begin
  Result := PWebKitFaviconDatabase(g_type_check_instance_cast(obj, WEBKIT_TYPE_FAVICON_DATABASE));
end;

function WEBKIT_IS_FAVICON_DATABASE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, WEBKIT_TYPE_FAVICON_DATABASE);
end;

// =====

function WEBKIT_FAVICON_DATABASE_ERROR: TGQuark;
begin
  WEBKIT_FAVICON_DATABASE_ERROR := webkit_favicon_database_error_quark;
end;


end.
