unit soup_auth_domain;

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
{$include "soup-types.h"}

{G_DECLARE_DERIVABLE_TYPE (SoupAuthDomain, soup_auth_domain, SOUP, AUTH_DOMAIN, GObject) }
type
  PSoupAuthDomainClass = ^TSoupAuthDomainClass;
  TSoupAuthDomainClass = record
      parent_class : TGObjectClass;
      accepts : function (domain:PSoupAuthDomain; msg:PSoupServerMessage; header:Pchar):Pchar;cdecl;
      challenge : function (domain:PSoupAuthDomain; msg:PSoupServerMessage):Pchar;cdecl;
      check_password : function (domain:PSoupAuthDomain; msg:PSoupServerMessage; username:Pchar; password:Pchar):Tgboolean;cdecl;
      padding : array[0..5] of Tgpointer;
    end;


  TSoupAuthDomainFilter = function (domain:PSoupAuthDomain; msg:PSoupServerMessage; user_data:Tgpointer):Tgboolean;cdecl;

  TSoupAuthDomainGenericAuthCallback = function (domain:PSoupAuthDomain; msg:PSoupServerMessage; username:Pchar; user_data:Tgpointer):Tgboolean;cdecl;

procedure soup_auth_domain_add_path(domain:PSoupAuthDomain; path:Pchar);cdecl;external libsoup;
procedure soup_auth_domain_remove_path(domain:PSoupAuthDomain; path:Pchar);cdecl;external libsoup;
procedure soup_auth_domain_set_filter(domain:PSoupAuthDomain; filter:TSoupAuthDomainFilter; filter_data:Tgpointer; dnotify:TGDestroyNotify);cdecl;external libsoup;
function soup_auth_domain_get_realm(domain:PSoupAuthDomain):Pchar;cdecl;external libsoup;
procedure soup_auth_domain_set_generic_auth_callback(domain:PSoupAuthDomain; auth_callback:TSoupAuthDomainGenericAuthCallback; auth_data:Tgpointer; dnotify:TGDestroyNotify);cdecl;external libsoup;
function soup_auth_domain_check_password(domain:PSoupAuthDomain; msg:PSoupServerMessage; username:Pchar; password:Pchar):Tgboolean;cdecl;external libsoup;
function soup_auth_domain_covers(domain:PSoupAuthDomain; msg:PSoupServerMessage):Tgboolean;cdecl;external libsoup;
function soup_auth_domain_accepts(domain:PSoupAuthDomain; msg:PSoupServerMessage):Pchar;cdecl;external libsoup;
procedure soup_auth_domain_challenge(domain:PSoupAuthDomain; msg:PSoupServerMessage);cdecl;external libsoup;

// === Konventiert am: 29-9-25 19:45:35 ===

function SOUP_TYPE_AUTH_DOMAIN: TGType;
function SOUP_AUTH_DOMAIN(obj: Pointer): PSoupAuthDomain;
function SOUP_IS_AUTH_DOMAIN(obj: Pointer): Tgboolean;
function SOUP_AUTH_DOMAIN_CLASS(klass: Pointer): PSoupAuthDomainClass;
function SOUP_IS_AUTH_DOMAIN_CLASS(klass: Pointer): Tgboolean;
function SOUP_AUTH_DOMAIN_GET_CLASS(obj: Pointer): PSoupAuthDomainClass;

implementation

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

type 
  TSoupAuthDomain = record
    parent_instance: TGObject;
  end;
  PSoupAuthDomain = ^TSoupAuthDomain;

  TSoupAuthDomainClass = record
  end;
  PSoupAuthDomainClass = ^TSoupAuthDomainClass;

function soup_auth_domain_get_type: TGType; cdecl; external libgxxxxxxx;



end.
