{$IFDEF read_interface}


type
  TSoupAuthDomainClass = record
    parent_class: TGObjectClass;
    accepts: function(domain: PSoupAuthDomain; msg: PSoupServerMessage; header: pchar): pchar; cdecl;
    challenge: function(domain: PSoupAuthDomain; msg: PSoupServerMessage): pchar; cdecl;
    check_password: function(domain: PSoupAuthDomain; msg: PSoupServerMessage; username: pchar; password: pchar): Tgboolean; cdecl;
    padding: array[0..5] of Tgpointer;
  end;
  PSoupAuthDomainClass = ^TSoupAuthDomainClass;

  TSoupAuthDomainFilter = function(domain: PSoupAuthDomain; msg: PSoupServerMessage; user_data: Tgpointer): Tgboolean; cdecl;
  TSoupAuthDomainGenericAuthCallback = function(domain: PSoupAuthDomain; msg: PSoupServerMessage; username: pchar; user_data: Tgpointer): Tgboolean; cdecl;

function soup_auth_domain_get_type: TGType; cdecl; external libsoup;
procedure soup_auth_domain_add_path(domain: PSoupAuthDomain; path: pchar); cdecl; external libsoup;
procedure soup_auth_domain_remove_path(domain: PSoupAuthDomain; path: pchar); cdecl; external libsoup;
procedure soup_auth_domain_set_filter(domain: PSoupAuthDomain; filter: TSoupAuthDomainFilter; filter_data: Tgpointer; dnotify: TGDestroyNotify); cdecl; external libsoup;
function soup_auth_domain_get_realm(domain: PSoupAuthDomain): pchar; cdecl; external libsoup;
procedure soup_auth_domain_set_generic_auth_callback(domain: PSoupAuthDomain; auth_callback: TSoupAuthDomainGenericAuthCallback; auth_data: Tgpointer; dnotify: TGDestroyNotify); cdecl; external libsoup;
function soup_auth_domain_check_password(domain: PSoupAuthDomain; msg: PSoupServerMessage; username: pchar; password: pchar): Tgboolean; cdecl; external libsoup;
function soup_auth_domain_covers(domain: PSoupAuthDomain; msg: PSoupServerMessage): Tgboolean; cdecl; external libsoup;
function soup_auth_domain_accepts(domain: PSoupAuthDomain; msg: PSoupServerMessage): pchar; cdecl; external libsoup;
procedure soup_auth_domain_challenge(domain: PSoupAuthDomain; msg: PSoupServerMessage); cdecl; external libsoup;

// === Konventiert am: 29-9-25 19:45:35 ===

function SOUP_TYPE_AUTH_DOMAIN: TGType;
function SOUP_AUTH_DOMAIN(obj: Pointer): PSoupAuthDomain;
function SOUP_IS_AUTH_DOMAIN(obj: Pointer): Tgboolean;
function SOUP_AUTH_DOMAIN_CLASS(klass: Pointer): PSoupAuthDomainClass;
function SOUP_IS_AUTH_DOMAIN_CLASS(klass: Pointer): Tgboolean;
function SOUP_AUTH_DOMAIN_GET_CLASS(obj: Pointer): PSoupAuthDomainClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function SOUP_TYPE_AUTH_DOMAIN: TGType;
begin
  Result := soup_auth_domain_get_type;
end;

function SOUP_AUTH_DOMAIN(obj: Pointer): PSoupAuthDomain;
begin
  Result := PSoupAuthDomain(g_type_check_instance_cast(obj, SOUP_TYPE_AUTH_DOMAIN));
end;

function SOUP_IS_AUTH_DOMAIN(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, SOUP_TYPE_AUTH_DOMAIN);
end;

function SOUP_AUTH_DOMAIN_CLASS(klass: Pointer): PSoupAuthDomainClass;
begin
  Result := PSoupAuthDomainClass(g_type_check_class_cast(klass, SOUP_TYPE_AUTH_DOMAIN));
end;

function SOUP_IS_AUTH_DOMAIN_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, SOUP_TYPE_AUTH_DOMAIN);
end;

function SOUP_AUTH_DOMAIN_GET_CLASS(obj: Pointer): PSoupAuthDomainClass;
begin
  Result := PSoupAuthDomainClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
