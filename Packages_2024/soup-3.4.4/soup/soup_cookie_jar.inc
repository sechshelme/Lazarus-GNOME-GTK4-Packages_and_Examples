{$IFDEF read_interface}


type
  TSoupCookieJarClass = record
    parent_class: TGObjectClass;
    save: procedure(jar: PSoupCookieJar); cdecl;
    is_persistent: function(jar: PSoupCookieJar): Tgboolean; cdecl;
    changed: procedure(jar: PSoupCookieJar; old_cookie: PSoupCookie; new_cookie: PSoupCookie); cdecl;
    padding: array[0..5] of Tgpointer;
  end;
  PSoupCookieJarClass = ^TSoupCookieJarClass;

  PSoupCookieJarAcceptPolicy = ^TSoupCookieJarAcceptPolicy;
  TSoupCookieJarAcceptPolicy = longint;

const
  SOUP_COOKIE_JAR_ACCEPT_ALWAYS = 0;
  SOUP_COOKIE_JAR_ACCEPT_NEVER = 1;
  SOUP_COOKIE_JAR_ACCEPT_NO_THIRD_PARTY = 2;
  SOUP_COOKIE_JAR_ACCEPT_GRANDFATHERED_THIRD_PARTY = 3;

function soup_cookie_jar_get_type: TGType; cdecl; external libsoup;
function soup_cookie_jar_new: PSoupCookieJar; cdecl; external libsoup;
function soup_cookie_jar_get_cookies(jar: PSoupCookieJar; uri: PGUri; for_http: Tgboolean): pchar; cdecl; external libsoup;
function soup_cookie_jar_get_cookie_list(jar: PSoupCookieJar; uri: PGUri; for_http: Tgboolean): PGSList; cdecl; external libsoup;
function soup_cookie_jar_get_cookie_list_with_same_site_info(jar: PSoupCookieJar; uri: PGUri; top_level: PGUri; site_for_cookies: PGUri; for_http: Tgboolean;
  is_safe_method: Tgboolean; is_top_level_navigation: Tgboolean): PGSList; cdecl; external libsoup;
procedure soup_cookie_jar_set_cookie(jar: PSoupCookieJar; uri: PGUri; cookie: pchar); cdecl; external libsoup;
procedure soup_cookie_jar_set_cookie_with_first_party(jar: PSoupCookieJar; uri: PGUri; first_party: PGUri; cookie: pchar); cdecl; external libsoup;
procedure soup_cookie_jar_add_cookie(jar: PSoupCookieJar; cookie: PSoupCookie); cdecl; external libsoup;
procedure soup_cookie_jar_add_cookie_with_first_party(jar: PSoupCookieJar; first_party: PGUri; cookie: PSoupCookie); cdecl; external libsoup;
procedure soup_cookie_jar_add_cookie_full(jar: PSoupCookieJar; cookie: PSoupCookie; uri: PGUri; first_party: PGUri); cdecl; external libsoup;
procedure soup_cookie_jar_delete_cookie(jar: PSoupCookieJar; cookie: PSoupCookie); cdecl; external libsoup;
function soup_cookie_jar_all_cookies(jar: PSoupCookieJar): PGSList; cdecl; external libsoup;
procedure soup_cookie_jar_set_accept_policy(jar: PSoupCookieJar; policy: TSoupCookieJarAcceptPolicy); cdecl; external libsoup;
function soup_cookie_jar_get_accept_policy(jar: PSoupCookieJar): TSoupCookieJarAcceptPolicy; cdecl; external libsoup;
function soup_cookie_jar_is_persistent(jar: PSoupCookieJar): Tgboolean; cdecl; external libsoup;

// === Konventiert am: 29-9-25 19:45:09 ===

function SOUP_TYPE_COOKIE_JAR: TGType;
function SOUP_COOKIE_JAR(obj: Pointer): PSoupCookieJar;
function SOUP_IS_COOKIE_JAR(obj: Pointer): Tgboolean;
function SOUP_COOKIE_JAR_CLASS(klass: Pointer): PSoupCookieJarClass;
function SOUP_IS_COOKIE_JAR_CLASS(klass: Pointer): Tgboolean;
function SOUP_COOKIE_JAR_GET_CLASS(obj: Pointer): PSoupCookieJarClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function SOUP_TYPE_COOKIE_JAR: TGType;
begin
  Result := soup_cookie_jar_get_type;
end;

function SOUP_COOKIE_JAR(obj: Pointer): PSoupCookieJar;
begin
  Result := PSoupCookieJar(g_type_check_instance_cast(obj, SOUP_TYPE_COOKIE_JAR));
end;

function SOUP_IS_COOKIE_JAR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, SOUP_TYPE_COOKIE_JAR);
end;

function SOUP_COOKIE_JAR_CLASS(klass: Pointer): PSoupCookieJarClass;
begin
  Result := PSoupCookieJarClass(g_type_check_class_cast(klass, SOUP_TYPE_COOKIE_JAR));
end;

function SOUP_IS_COOKIE_JAR_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, SOUP_TYPE_COOKIE_JAR);
end;

function SOUP_COOKIE_JAR_GET_CLASS(obj: Pointer): PSoupCookieJarClass;
begin
  Result := PSoupCookieJarClass(PGTypeInstance(obj)^.g_class);
end;


{$ENDIF read_implementation}
