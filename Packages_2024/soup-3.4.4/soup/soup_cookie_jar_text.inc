{$IFDEF read_interface}


type
  TSoupCookieJarText = record
  end;
  PSoupCookieJarText = ^TSoupCookieJarText;

  TSoupCookieJarTextClass = record
    parent_class: TSoupCookieJarClass;
  end;
  PSoupCookieJarTextClass = ^TSoupCookieJarTextClass;

function soup_cookie_jar_text_get_type: TGType; cdecl; external libsoup;
function soup_cookie_jar_text_new(filename: pchar; read_only: Tgboolean): PSoupCookieJar; cdecl; external libsoup;

// === Konventiert am: 29-9-25 19:45:03 ===

function SOUP_TYPE_COOKIE_JAR_TEXT: TGType;
function SOUP_COOKIE_JAR_TEXT(obj: Pointer): PSoupCookieJarText;
function SOUP_IS_COOKIE_JAR_TEXT(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function SOUP_TYPE_COOKIE_JAR_TEXT: TGType;
begin
  Result := soup_cookie_jar_text_get_type;
end;

function SOUP_COOKIE_JAR_TEXT(obj: Pointer): PSoupCookieJarText;
begin
  Result := PSoupCookieJarText(g_type_check_instance_cast(obj, SOUP_TYPE_COOKIE_JAR_TEXT));
end;

function SOUP_IS_COOKIE_JAR_TEXT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, SOUP_TYPE_COOKIE_JAR_TEXT);
end;



{$ENDIF read_implementation}
