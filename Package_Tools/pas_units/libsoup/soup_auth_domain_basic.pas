unit soup_auth_domain_basic;

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

{G_DECLARE_FINAL_TYPE (SoupAuthDomainBasic, soup_auth_domain_basic, SOUP, AUTH_DOMAIN_BASIC, SoupAuthDomain) }
function soup_auth_domain_basic_new(optname1:Pchar; args:array of const):PSoupAuthDomain;cdecl;external libsoup;
function soup_auth_domain_basic_new(optname1:Pchar):PSoupAuthDomain;cdecl;external libsoup;
type

  TSoupAuthDomainBasicAuthCallback = function (domain:PSoupAuthDomain; msg:PSoupServerMessage; username:Pchar; password:Pchar; user_data:Tgpointer):Tgboolean;cdecl;

procedure soup_auth_domain_basic_set_auth_callback(domain:PSoupAuthDomain; callback:TSoupAuthDomainBasicAuthCallback; user_data:Tgpointer; dnotify:TGDestroyNotify);cdecl;external libsoup;

// === Konventiert am: 29-9-25 19:45:32 ===

function SOUP_TYPE_AUTH_DOMAIN_BASIC: TGType;
function SOUP_AUTH_DOMAIN_BASIC(obj: Pointer): PSoupAuthDomainBasic;
function SOUP_IS_AUTH_DOMAIN_BASIC(obj: Pointer): Tgboolean;

implementation

function SOUP_TYPE_AUTH_DOMAIN_BASIC: TGType;
begin
  Result := soup_auth_domain_basic_get_type;
end;

function SOUP_AUTH_DOMAIN_BASIC(obj: Pointer): PSoupAuthDomainBasic;
begin
  Result := PSoupAuthDomainBasic(g_type_check_instance_cast(obj, SOUP_TYPE_AUTH_DOMAIN_BASIC));
end;

function SOUP_IS_AUTH_DOMAIN_BASIC(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, SOUP_TYPE_AUTH_DOMAIN_BASIC);
end;

type 
  TSoupAuthDomainBasic = record
  end;
  PSoupAuthDomainBasic = ^TSoupAuthDomainBasic;

  TSoupAuthDomainBasicClass = record
    parent_class: TSoupAuthDomainClass;
  end;
  PSoupAuthDomainBasicClass = ^TSoupAuthDomainBasicClass;

function soup_auth_domain_basic_get_type: TGType; cdecl; external libgxxxxxxx;



end.
