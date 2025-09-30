unit soup_auth_domain_digest;

interface

uses
  fp_glib2, fp_soup, soup_auth_domain, soup_server_message;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



type
  TSoupAuthDomainDigest = record
  end;
  PSoupAuthDomainDigest = ^TSoupAuthDomainDigest;

  TSoupAuthDomainDigestClass = record
    parent_class: TSoupAuthDomainClass;
  end;
  PSoupAuthDomainDigestClass = ^TSoupAuthDomainDigestClass;

function soup_auth_domain_digest_get_type: TGType; cdecl; external libsoup;
function soup_auth_domain_digest_new(optname1: pchar): PSoupAuthDomain; cdecl; varargs; external libsoup;

type
  PSoupAuthDomainDigestAuthCallback = ^TSoupAuthDomainDigestAuthCallback;
  TSoupAuthDomainDigestAuthCallback = function(domain: PSoupAuthDomain; msg: PSoupServerMessage; username: pchar; user_data: Tgpointer): pchar; cdecl;

procedure soup_auth_domain_digest_set_auth_callback(domain: PSoupAuthDomain; callback: TSoupAuthDomainDigestAuthCallback; user_data: Tgpointer; dnotify: TGDestroyNotify); cdecl; external libsoup;
function soup_auth_domain_digest_encode_password(username: pchar; realm: pchar; password: pchar): pchar; cdecl; external libsoup;

// === Konventiert am: 29-9-25 19:45:29 ===

function SOUP_TYPE_AUTH_DOMAIN_DIGEST: TGType;
function SOUP_AUTH_DOMAIN_DIGEST(obj: Pointer): PSoupAuthDomainDigest;
function SOUP_IS_AUTH_DOMAIN_DIGEST(obj: Pointer): Tgboolean;

implementation

function SOUP_TYPE_AUTH_DOMAIN_DIGEST: TGType;
begin
  Result := soup_auth_domain_digest_get_type;
end;

function SOUP_AUTH_DOMAIN_DIGEST(obj: Pointer): PSoupAuthDomainDigest;
begin
  Result := PSoupAuthDomainDigest(g_type_check_instance_cast(obj, SOUP_TYPE_AUTH_DOMAIN_DIGEST));
end;

function SOUP_IS_AUTH_DOMAIN_DIGEST(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, SOUP_TYPE_AUTH_DOMAIN_DIGEST);
end;



end.
