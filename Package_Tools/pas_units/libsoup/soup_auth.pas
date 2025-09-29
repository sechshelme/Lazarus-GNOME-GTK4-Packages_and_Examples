unit soup_auth;

interface

uses
  fp_glib2, fp_soup;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*-  }
{
 * Copyright (C) 2001-2003, Ximian, Inc.
  }
(** unsupported pragma#pragma once*)
{$include "soup-types.h"}
{$include "soup-headers.h"}

{G_DECLARE_DERIVABLE_TYPE (SoupAuth, soup_auth, SOUP, AUTH, GObject) }
type
  PSoupAuthClass = ^TSoupAuthClass;
  TSoupAuthClass = record
      parent_class : TGObjectClass;
      scheme_name : Pchar;
      strength : Tguint;
      update : function (auth:PSoupAuth; msg:PSoupMessage; auth_header:PGHashTable):Tgboolean;cdecl;
      get_protection_space : function (auth:PSoupAuth; source_uri:PGUri):PGSList;cdecl;
      authenticate : procedure (auth:PSoupAuth; username:Pchar; password:Pchar);cdecl;
      is_authenticated : function (auth:PSoupAuth):Tgboolean;cdecl;
      get_authorization : function (auth:PSoupAuth; msg:PSoupMessage):Pchar;cdecl;
      is_ready : function (auth:PSoupAuth; msg:PSoupMessage):Tgboolean;cdecl;
      can_authenticate : function (auth:PSoupAuth):Tgboolean;cdecl;
      padding : array[0..5] of Tgpointer;
    end;


function soup_auth_new(_type:TGType; msg:PSoupMessage; auth_header:Pchar):PSoupAuth;cdecl;external libsoup;
function soup_auth_update(auth:PSoupAuth; msg:PSoupMessage; auth_header:Pchar):Tgboolean;cdecl;external libsoup;
function soup_auth_is_for_proxy(auth:PSoupAuth):Tgboolean;cdecl;external libsoup;
function soup_auth_get_scheme_name(auth:PSoupAuth):Pchar;cdecl;external libsoup;
function soup_auth_get_authority(auth:PSoupAuth):Pchar;cdecl;external libsoup;
function soup_auth_get_realm(auth:PSoupAuth):Pchar;cdecl;external libsoup;
function soup_auth_get_info(auth:PSoupAuth):Pchar;cdecl;external libsoup;
procedure soup_auth_authenticate(auth:PSoupAuth; username:Pchar; password:Pchar);cdecl;external libsoup;
procedure soup_auth_cancel(auth:PSoupAuth);cdecl;external libsoup;
function soup_auth_is_authenticated(auth:PSoupAuth):Tgboolean;cdecl;external libsoup;
function soup_auth_is_cancelled(auth:PSoupAuth):Tgboolean;cdecl;external libsoup;
function soup_auth_is_ready(auth:PSoupAuth; msg:PSoupMessage):Tgboolean;cdecl;external libsoup;
function soup_auth_can_authenticate(auth:PSoupAuth):Tgboolean;cdecl;external libsoup;
function soup_auth_get_authorization(auth:PSoupAuth; msg:PSoupMessage):Pchar;cdecl;external libsoup;
function soup_auth_get_protection_space(auth:PSoupAuth; source_uri:PGUri):PGSList;cdecl;external libsoup;
procedure soup_auth_free_protection_space(auth:PSoupAuth; space:PGSList);cdecl;external libsoup;
function soup_auth_negotiate_supported:Tgboolean;cdecl;external libsoup;
{ was #define dname def_expr }
function SOUP_TYPE_AUTH_BASIC : longint; { return type might be wrong }

function soup_auth_basic_get_type:TGType;cdecl;external libsoup;
{ was #define dname def_expr }
function SOUP_TYPE_AUTH_DIGEST : longint; { return type might be wrong }

function soup_auth_digest_get_type:TGType;cdecl;external libsoup;
{ was #define dname def_expr }
function SOUP_TYPE_AUTH_NTLM : longint; { return type might be wrong }

function soup_auth_ntlm_get_type:TGType;cdecl;external libsoup;
{ was #define dname def_expr }
function SOUP_TYPE_AUTH_NEGOTIATE : longint; { return type might be wrong }

function soup_auth_negotiate_get_type:TGType;cdecl;external libsoup;

// === Konventiert am: 29-9-25 19:45:39 ===

function SOUP_TYPE_AUTH: TGType;
function SOUP_AUTH(obj: Pointer): PSoupAuth;
function SOUP_IS_AUTH(obj: Pointer): Tgboolean;
function SOUP_AUTH_CLASS(klass: Pointer): PSoupAuthClass;
function SOUP_IS_AUTH_CLASS(klass: Pointer): Tgboolean;
function SOUP_AUTH_GET_CLASS(obj: Pointer): PSoupAuthClass;

implementation

function SOUP_TYPE_AUTH: TGType;
begin
  Result := soup_auth_get_type;
end;

function SOUP_AUTH(obj: Pointer): PSoupAuth;
begin
  Result := PSoupAuth(g_type_check_instance_cast(obj, SOUP_TYPE_AUTH));
end;

function SOUP_IS_AUTH(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, SOUP_TYPE_AUTH);
end;

function SOUP_AUTH_CLASS(klass: Pointer): PSoupAuthClass;
begin
  Result := PSoupAuthClass(g_type_check_class_cast(klass, SOUP_TYPE_AUTH));
end;

function SOUP_IS_AUTH_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, SOUP_TYPE_AUTH);
end;

function SOUP_AUTH_GET_CLASS(obj: Pointer): PSoupAuthClass;
begin
  Result := PSoupAuthClass(PGTypeInstance(obj)^.g_class);
end;

type 
  TSoupAuth = record
    parent_instance: TGObject;
  end;
  PSoupAuth = ^TSoupAuth;

  TSoupAuthClass = record
  end;
  PSoupAuthClass = ^TSoupAuthClass;

function soup_auth_get_type: TGType; cdecl; external libgxxxxxxx;


{ was #define dname def_expr }
function SOUP_TYPE_AUTH_BASIC : longint; { return type might be wrong }
  begin
    SOUP_TYPE_AUTH_BASIC:=soup_auth_basic_get_type;
  end;

{ was #define dname def_expr }
function SOUP_TYPE_AUTH_DIGEST : longint; { return type might be wrong }
  begin
    SOUP_TYPE_AUTH_DIGEST:=soup_auth_digest_get_type;
  end;

{ was #define dname def_expr }
function SOUP_TYPE_AUTH_NTLM : longint; { return type might be wrong }
  begin
    SOUP_TYPE_AUTH_NTLM:=soup_auth_ntlm_get_type;
  end;

{ was #define dname def_expr }
function SOUP_TYPE_AUTH_NEGOTIATE : longint; { return type might be wrong }
  begin
    SOUP_TYPE_AUTH_NEGOTIATE:=soup_auth_negotiate_get_type;
  end;


end.
