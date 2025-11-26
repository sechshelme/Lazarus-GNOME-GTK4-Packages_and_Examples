{$IFDEF read_interface}


type
  TSoupCookieJarDB = record
  end;
  PSoupCookieJarDB = ^TSoupCookieJarDB;

  TSoupCookieJarDBClass = record
    parent_class: TSoupCookieJarClass;
  end;
  PSoupCookieJarDBClass = ^TSoupCookieJarDBClass;

function soup_cookie_jar_db_get_type: TGType; cdecl; external libsoup;
function soup_cookie_jar_db_new(filename: pchar; read_only: Tgboolean): PSoupCookieJar; cdecl; external libsoup;

// === Konventiert am: 29-9-25 19:45:05 ===

function SOUP_TYPE_COOKIE_JAR_DB: TGType;
function SOUP_COOKIE_JAR_DB(obj: Pointer): PSoupCookieJarDB;
function SOUP_IS_COOKIE_JAR_DB(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function SOUP_TYPE_COOKIE_JAR_DB: TGType;
begin
  Result := soup_cookie_jar_db_get_type;
end;

function SOUP_COOKIE_JAR_DB(obj: Pointer): PSoupCookieJarDB;
begin
  Result := PSoupCookieJarDB(g_type_check_instance_cast(obj, SOUP_TYPE_COOKIE_JAR_DB));
end;

function SOUP_IS_COOKIE_JAR_DB(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, SOUP_TYPE_COOKIE_JAR_DB);
end;



{$ENDIF read_implementation}
