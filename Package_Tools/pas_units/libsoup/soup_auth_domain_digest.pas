unit soup_auth_domain_digest;

interface

uses
  fp_glib2, fp_soup;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*-  }
{
 * Copyright (C) 2007 Novell, Inc.
  }
(** unsupported pragma#pragma once*)
{$include "soup-auth-domain.h"}

{G_DECLARE_FINAL_TYPE (SoupAuthDomainDigest, soup_auth_domain_digest, SOUP, AUTH_DOMAIN_DIGEST, SoupAuthDomain) }
function soup_auth_domain_digest_new(optname1:Pchar; args:array of const):PSoupAuthDomain;cdecl;external libsoup;
function soup_auth_domain_digest_new(optname1:Pchar):PSoupAuthDomain;cdecl;external libsoup;
type
  PSoupAuthDomainDigestAuthCallback = ^TSoupAuthDomainDigestAuthCallback;
  TSoupAuthDomainDigestAuthCallback = function (domain:PSoupAuthDomain; msg:PSoupServerMessage; username:Pchar; user_data:Tgpointer):Pchar;cdecl;

procedure soup_auth_domain_digest_set_auth_callback(domain:PSoupAuthDomain; callback:TSoupAuthDomainDigestAuthCallback; user_data:Tgpointer; dnotify:TGDestroyNotify);cdecl;external libsoup;
function soup_auth_domain_digest_encode_password(username:Pchar; realm:Pchar; password:Pchar):Pchar;cdecl;external libsoup;

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

type 
  TSoupAuthDomainDigest = record
  end;
  PSoupAuthDomainDigest = ^TSoupAuthDomainDigest;

  TSoupAuthDomainDigestClass = record
    parent_class: TSoupAuthDomainClass;
  end;
  PSoupAuthDomainDigestClass = ^TSoupAuthDomainDigestClass;

function soup_auth_domain_digest_get_type: TGType; cdecl; external libgxxxxxxx;



end.
